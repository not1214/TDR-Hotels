class Admin::HotelsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @hotels = Hotel.all.page(params[:page]).per(9)
    @categories = Category.all
    @areas = Area.all
  end

  def new
    @hotel = Hotel.new
    @hotel.hotel_images.build
    @categories = Category.all
    @areas = Area.all
  end

  def create
    @hotel = Hotel.new(hotel_params)
    if @hotel.save
      flash[:notice] = "ホテル情報を登録しました。"
      redirect_to admin_hotel_path(@hotel)
    else
      flash.now[:alert] = "ホテル情報を登録できませんでした。"
      render :new
    end
  end

  def show
    @hotel = Hotel.find(params[:id])
  end

  def edit
    @hotel = Hotel.find(params[:id])
    @hotel.hotel_images.all
    @categories = Category.all
    @areas = Area.all
  end

  def update
    @hotel = Hotel.find(params[:id])
    if @hotel.update(hotel_params)
      flash[:notice] = "ホテル情報を更新しました。"
      redirect_to admin_hotel_path(@hotel)
    else
      flash.now[:alert] = "ホテル情報を更新できませんでした。再度入力してください。"
      render :edit
    end
  end

  private

  def hotel_params
    params.require(:hotel).permit(:category_id, :area_id, :hotel_name, :price_range,:website, :caption, :address ,:latitude, :longitude, hotel_images_images: [])
  end

end
