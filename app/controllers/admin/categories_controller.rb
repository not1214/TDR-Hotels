class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "カテゴリーの名前を更新しました。"
      redirect_to admin_categories_path
    end
  end

end
