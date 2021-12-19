class Public::SearchesController < ApplicationController

  def hotel_search
    @hotel_search = Hotel.search(params[:keyword])
    @categories = Category.all
    @areas = Area.all
  end

end
