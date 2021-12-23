class Public::AreasController < ApplicationController

  def show
    @categories = Category.all
    @areas = Area.all
    @area = Area.find(params[:id])
    @area_hotel = Hotel.where(area_id: @area.id)
    gon.hotels = Hotel.all
  end

end
