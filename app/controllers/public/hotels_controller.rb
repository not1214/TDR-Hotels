class Public::HotelsController < ApplicationController

  before_action :authenticate_member!, except:[:index]

  def index
    @hotels = Hotel.all
    @categories = Category.all
    @areas = Area.all
  end

  def show
    @hotel = Hotel.find(params[:id])
  end

  def ranking
    @rate_ranks = Hotel.find(Review.group(:hotel_id).order("avg(rate) desc").limit(5).pluck(:hotel_id))
    @favorite_ranks = Hotel.find(Favorite.group(:hotel_id).order("count(hotel_id) desc").pluck(:hotel_id))
  end
end
