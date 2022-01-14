class Public::ReviewsController < ApplicationController
  before_action :authenticate_member!

  def index
    @hotel = Hotel.find_by(id: params[:hotel_id])
    @reviews = Review.where(hotel_id: params[:hotel_id], review_image_status: false).order("created_at DESC").page(params[:page]).per(5)
    gon.hotel = Hotel.find_by(id: params[:hotel_id])
  end

  def show
    @hotel = Hotel.find_by(id: params[:hotel_id])
    @review = Review.find(params[:id])
    @review_comment = ReviewComment.new
    gon.hotel = Hotel.find_by(id: params[:hotel_id])
  end

  def new
    @hotel = Hotel.find_by(id: params[:hotel_id])
    @review = Review.new
    gon.hotel = Hotel.find_by(id: params[:hotel_id])
  end

  def create
    @hotel = Hotel.find_by(id: params[:hotel_id])
    @review = current_member.reviews.new(review_params)
    @review.content_score = Language.get_data(review_params[:content]) * 10
    # binding.pry
    @review.hotel_id = @hotel.id
    if @review.save
      flash[:notice] = 'レビューを投稿しました。'
      redirect_to hotel_reviews_path(@hotel)
      if Vision.image_analysis(@review.review_image)
        # binding.pry
        @review.review_image_status = true
        @review.save
        flash[:notice] = nil
        flash[:alert] = "不適切な画像です。マイページから画像を変更してください。"
      end
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
    gon.hotel = Hotel.find_by(id: params[:hotel_id])
  end

  def update
    @hotel = Hotel.find_by(id: params[:hotel_id])
    @review = current_member.reviews.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = 'レビューを編集しました。'
      redirect_to hotel_review_path(@hotel, @review)
      if Vision.image_analysis(@review.review_image)
        # binding.pry
        @review.update(review_image_status: true)
        flash[:notice] = nil
        flash[:alert] = "不適切な画像です。マイページから画像を変更してください。"
      else
        @review.update(review_image_status: false)
      end
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
