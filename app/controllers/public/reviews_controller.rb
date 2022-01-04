class Public::ReviewsController < ApplicationController
  before_action :authenticate_member!

  def index
    @hotel = Hotel.find_by(id: params[:hotel_id])
    @reviews = Review.where(hotel_id: params[:hotel_id]).page(params[:page]).per(5)
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
    @review.content_score = Language.get_data(review_params[:content]) * 10
    #binding.pry
    @review.hotel_id = @hotel.id
    if @review.save
      flash[:notice] = 'レビューを投稿しました。'
      redirect_to hotel_reviews_path(@hotel)
    else
      flash.now[:alert] = 'レビューを投稿できませんでした。もう一度入力してください。'
      render :new
    end 
  end

  def edit
    @hotel = Hotel.find_by(id: params[:hotel_id])
    @review = Review.find(params[:id])
    if @review.member_id != current_member.id
      flash[:alert] = '不正なアクセスです。'
      redirect_to hotel_review_path(@hotel, @review)
    end
  end

  def update
    @hotel = Hotel.find_by(id: params[:hotel_id])
    @review = current_member.reviews.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = 'レビューを編集しました。'
      redirect_to hotel_review_path(@hotel, @review)
    else
      flash.now[:alert] = 'レビューを編集できませんでした。再度入力してください。'
      render :edit
    end
  end

  def destroy
    @hotel = Hotel.find_by(id: params[:hotel_id])
    @review = current_member.reviews.find(params[:id])
    @review.destroy
    flash[:notice] = 'レビューを削除しました。'
    redirect_to hotel_reviews_path(@hotel)
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :review_image, :rate)
  end
end
