class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @category = Category.new
  end

  def show
    @categories = Category.all
    @areas = Area.all
    @category = Category.find(params[:id])
    @category_hotel = Hotel.where(category_id: @category.id)
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "カテゴリーを登録しました"
      redirect_to admin_categories_path
    else
      flash[:alert] = "カテゴリーを登録できませんでした。再度入力してください。"
      @categories = Category.all
      render :index
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "カテゴリーを更新しました。"
      redirect_to admin_categories_path
    else
      flash[:alert] = "カテゴリーを更新できませんでした。再度入力してください。"
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:notice] = "カテゴリーを削除しました。"
      redirect_to admin_categories_path
    else
      @categories = Category.all
      render :index
    end
  end

  private

  def category_params
    params.require(:category).permit(:category_name)
  end

end
