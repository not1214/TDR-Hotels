class Public::HomesController < ApplicationController

  def top
    @categories = Category.all
    @areas = Area.all
    @hotels = Hotel.all
  end

  def about
  end

end
