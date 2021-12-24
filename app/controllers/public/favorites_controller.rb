class Public::FavoritesController < ApplicationController

  before_action :authenticate_member!

  def create
    @hotel = Hotel.find(params[:hotel_id])
    @favorite = current_member.favorites.find_by(hotel_id: @hotel.id)
    unless @favorite.present?
      @favorite = current_member.favorites.create(hotel_id: @hotel.id)
      flash[:alert] = nil
      flash[:notice] = "お気に入りに追加しました。"
    end
  end

  def destroy
    @hotel = Hotel.find(params[:hotel_id])
    @favorite = current_member.favorites.find_by(hotel_id: @hotel.id)
    if @favorite.present?
      @favorite.destroy
      flash[:notice] = nil
      flash.now[:alert] = "お気に入りから削除しました。"
    end
  end

end
