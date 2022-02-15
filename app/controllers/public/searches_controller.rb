class Public::SearchesController < ApplicationController
  def hotel_search
    @keyword = params[:keyword]
    @hotel_search = Hotel.includes(:area, :category).search(@keyword).page(params[:page]).per(12)
    @categories = Category.all
    @areas = Area.all
    gon.hotels = Hotel.all
  end
end
