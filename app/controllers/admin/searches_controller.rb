class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!

  def hotel_search
    @hotel_search = Hotel.includes(:area, :category).search(params[:keyword]).page(params[:page]).per(9)
    @categories = Category.all
    @areas = Area.all
    gon.hotels = Hotel.all
  end
end
