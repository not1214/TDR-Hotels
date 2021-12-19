class Public::PicturesController < ApplicationController

  before_action :authenticate_member!

  def index
    @pictures = Picture.all
  end

end
