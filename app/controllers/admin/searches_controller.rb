class Admin::SearchesController < ApplicationController

  before_action :authenticate_admin!

  def hotel_search
    @hotel_search = Hotel.search(params[:keyword])
    @categories = Category.all
    @areas = Area.all
  end

end
