class Public::PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

end
