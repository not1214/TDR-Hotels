class Public::ReviewsController < ApplicationController
  def index
    @hotel = Hotel.find(params[:id])
    @reviews = Review.all
  end

  def show
    @hotel = Hotel.find(params[:id])
    @review = Review.find(params[:id])
  end

  def new
    @hotel = Hotel.find(params[:id])
    @review = Review.new
  end

  def create
    @hotel = Hotel.find(params[:id])
    @review = current_member.reviews.new(review_params)
    @review.hotel_id = hotel
    if @review.save
      flash[:notice] = "レビューを投稿しました。"
      redirect_to hotel_reviews_path(@review)
    else
      flash[:alert] = "レビューを投稿できませんでした。もう一度入力してください。"
      render :new
    end
  end

  def edit
    @review = current_member.reviews.find(params[:id])
  end

  def updated
    @review = current_member.reviews.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "レビューを編集しました。"
      redirect_to hotel_review_path
    else
      flash[:alert] = "レビューを編集できませんでした。再度入力してください。"
      render :edit
    end
  end

  def destroy
    @hotel = Hotel.find(params[:id])
    @review = current_member.reviews.find(params[:id])
    @review.destroy
    flash[:notice] = "レビューを削除しました。"
    redirect_to hotel_reviews_path(@hotel)
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :review_image, :rate)
  end

end
