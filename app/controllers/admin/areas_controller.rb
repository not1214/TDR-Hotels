class Admin::AreasController < ApplicationController
  before_action :authenticate_admin!

  def index
    @areas = Area.all
    @area = Area.new
  end

  def show
    @categories = Category.all
    @areas = Area.all
    @area = Area.find(params[:id])
    @area_hotel = Hotel.where(area_id: @area.id).page(params[:page]).per(12)
    gon.hotels = Hotel.all
  end

  def create
    @area = Area.new(area_params)
    # binding.pry
    if @area.save
      flash[:notice] = 'エリアを登録しました。'
      redirect_to admin_areas_path
    else
      flash.now[:alert] = 'エリアを登録できませんでした。再度入力してください。'
      @areas = Area.all
      render :index
    end
  end

  def edit
    @area = Area.find(params[:id])
  end

  def update
    @area = Area.find(params[:id])
    if @area.update(area_params)
      flash[:notice] = 'エリアを更新しました。'
      redirect_to admin_areas_path
    else
      flash.now[:alert] = 'エリアを更新できませんでした。再度入力してください。'
      render :edit
    end
  end

  def destroy
    @area = Area.find(params[:id])
    @area.destroy
    flash[:notice] = 'カテゴリを削除しました。'
    redirect_to admin_areas_path
  end

  private

  def area_params
    params.require(:area).permit(:area_name)
  end
end
