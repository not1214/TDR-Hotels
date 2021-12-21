class Public::SearchesController < ApplicationController

  def hotel_search
    @hotel_search = Hotel.search(params[:keyword]).page(params[:page]).per(9)
    @categories = Category.all
    @areas = Area.all
  end

end
