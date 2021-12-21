class Admin::ReviewsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @hotel = Hotel.find_by(id: params[:hotel_id])
    @reviews = Review.where(hotel_id: params[:hotel_id]).page(params[:page]).per(5)
  end

  def show
    @hotel = Hotel.find_by(id: params[:hotel_id])
    @review = Review.find(params[:id])
  end

  def edit
    @hotel = Hotel.find_by(id: params[:hotel_id])
    @review = Review.find(params[:id])
  end

  def update
   @hotel = Hotel.find_by(id: params[:hotel_id])
   @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "レビューを更新しました。"
      redirect_to admin_hotel_review_path(@hotel,@review)
    else
      flash[:alert] = "レビューを更新できませんでした。再度入力してください。"
      render :edit
    end
  end

  def destroy
    @hotel = Hotel.find_by(id: params[:hotel_id])
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "レビューを削除しました。"
    redirect_to admin_hotel_reviews_path(@hotel)
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :review_image, :rate)
  end

end
