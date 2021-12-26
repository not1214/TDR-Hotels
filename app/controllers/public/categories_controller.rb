class Public::CategoriesController < ApplicationController
  def show
    @categories = Category.all
    @areas = Area.all
    @category = Category.find(params[:id])
    @category_hotel = Hotel.where(category_id: @category.id).page(params[:page]).per(12)
    gon.hotels = Hotel.all
  end
end
