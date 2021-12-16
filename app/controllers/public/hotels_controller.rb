class Public::HotelsController < ApplicationController
  def index
    @hotels = Hotel.all
    @categories = Category.all
    @areas = Area.all
  end

  def show
    @hotel = Hotel.find(params[:id])
  end

  def ranking
    @ranks = Hotel.find(Review.group(:hotel_id).order("avg(rate) desc").limit(5).pluck(:hotel_id))
  end
end
