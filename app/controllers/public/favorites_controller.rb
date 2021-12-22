class Public::FavoritesController < ApplicationController

  before_action :authenticate_member!

  def create
    @hotel = Hotel.find(params[:hotel_id])
    @favorite = current_member.favorites.create(hotel_id: @hotel.id)
    flash[:notice] = "お気に入りに追加しました。"
  end

  def destroy
    @hotel = Hotel.find(params[:hotel_id])
    @favorite = current_member.favorites.find_by(hotel_id: @hotel.id)
    @favorite.destroy
    flash[:alert] = "お気に入りから削除しました。"
  end

end
