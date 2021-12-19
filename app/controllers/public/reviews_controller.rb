class Public::ReviewsController < ApplicationController

  before_action :authenticate_member!

  def index
    @hotel = Hotel.find_by(id: params[:hotel_id])
    @reviews = Review.where(hotel_id: params[:hotel_id])
  end

  def show
    @hotel = Hotel.find_by(id: params[:hotel_id])
    @review = Review.find(params[:id])
    @review_comment = ReviewComment.new
  end

  def new
    @hotel = Hotel.find_by(id: params[:hotel_id])
    @review = Review.new
  end

  def create
    @hotel = Hotel.find_by(id: params[:hotel_id])
    @review = current_member.reviews.new(review_params)
    @review.hotel_id = @hotel.id
    if @review.save
      flash[:notice] = "レビューを投稿しました。"
      redirect_to hotel_reviews_path(@hotel)
    else
      flash[:alert] = "レビューを投稿できませんでした。もう一度入力してください。"
      render :new
    end
  end

  def edit
    @hotel = Hotel.find_by(id: params[:hotel_id])
    @review = current_member.reviews.find(params[:id])
  end

  def update
    @hotel = Hotel.find_by(id: params[:hotel_id])
    @review = current_member.reviews.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "レビューを編集しました。"
      redirect_to hotel_review_path(@hotel,@review)
    else
      flash[:alert] = "レビューを編集できませんでした。再度入力してください。"
      render :edit
    end
  end

  def destroy
    @hotel = Hotel.find_by(id: params[:hotel_id])
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
