class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category.new(category_params)
    if @category.save
      flash[:notice] = "カテゴリーを登録しました"
      redirect_to admin_categories_path
    else
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
      flash[:notice] = "カテゴリーの名前を更新しました。"
      redirect_to admin_categories_path
    else
      flash[:alert] = "登録できませんでした。再度入力してください。"
      render :edit
    end
  end

  private

  def category_params
    params.require(:category).permit(:category_name)
  end

end
