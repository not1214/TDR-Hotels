class Public::HomesController < ApplicationController

  def top
    @categories = Category.all
    @areas = Area.all
  end

  def about
    @categories = Category.all
    @areas = Area.all
    @hotels = Hotel.limit(3).order(created_at: :desc)
  end

end
