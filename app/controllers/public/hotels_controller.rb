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
  end
end
