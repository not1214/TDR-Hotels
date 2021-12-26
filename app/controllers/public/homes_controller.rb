class Public::HomesController < ApplicationController
  def top
    @categories = Category.all
    @areas = Area.all
  end

  def about
    @categories = Category.all
    @areas = Area.all
    @hotels = Hotel.includes(:area, :category).limit(5).order(created_at: :desc)
    gon.hotels = Hotel.all
  end

  def privacy
  end

end
