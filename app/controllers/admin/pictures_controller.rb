class Admin::PicturesController < ApplicationController

  before_action :authenticate_admin!

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save!
      flash[:notice] = "写真を登録しました。"
      redirect_to admin_pictures_path
    else
      flash[:alert] = "写真を登録できませんでした。再度入力してください。"
      render :new
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = "写真を削除しました。"
    redirect_to admin_pictures_path
  end

  private

  def picture_params
    params.require(:picture).permit(:image, :image_name)
  end

end
