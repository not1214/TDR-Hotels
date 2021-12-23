class Public::PicturesController < ApplicationController

  before_action :authenticate_member!

  def index
    @pictures = Picture.all.page(params[:page]).per(18)
  end

end
