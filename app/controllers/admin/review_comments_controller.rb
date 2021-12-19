class Admin::ReviewCommentsController < ApplicationController

  before_action :authenticate_admin!

  def destroy
    @review = Review.find(params[:review_id])
    ReviewComment.find_by(id: params[:id]).destroy
  end

end
