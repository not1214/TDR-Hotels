class Public::FavoritesController < ApplicationController

  before_action :authenticate_member!

  def create
    @hotel = Hotel.find(params[:hotel_id])
    @favorite = current_member.favorites.create(hotel_id: @hotel.id)
  end

  def destroy
    @hotel = Hotel.find(params[:hotel_id])
    @favorite = current_member.favorites.find_by(hotel_id: @hotel.id)
    @favorite.destroy
  end

end
