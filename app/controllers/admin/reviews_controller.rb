class Admin::ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def updated
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "レビューを更新しました。"
      redirect_to admin_hotel_review_path(@review)
    else
      flash[:alert] = "レビューを更新できませんでした。再度入力してください。"
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    refdirect_to admin_hotel_reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :review_image, :rate)
  end

end
