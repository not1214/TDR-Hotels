class Admin::AreasController < ApplicationController
  def index
    @areas = Area.all
    @area = Area.new
  end

  def show
    @categories = Category.all
    @areas = Area.all
    @area = Area.find(params[:id])
    @area_hotel = Hotel.where(area_id: @area.id)
  end

  def create
    @area = Area.new(area_params)
    if @area.save
      flash[:notice] = "エリアを登録しました。"
      redirect_to admin_areas_path
    else
      flash[:alert] = "エリアを登録できませんでした。再度入力してください。"
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
      flash[:notice] = "エリアを更新しました。"
      redirect_to admin_areas_path
    else
      flash[:alert] = "エリアを更新できませんでした。再度入力してください。"
      render :edit
    end
  end

  private

    def area_params
      params.require(:area).permit(:area_name)
    end

end
