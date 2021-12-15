class Public::ReviewCommentsController < ApplicationController

  def create
    review = Review.find(params[:id])
    comment = current_member.review_comments.new(review_comment_params)
    comment.review_id = review.id
    comment.save
    redirect_to hotel_review_path(review.hotel_id, review)
  end

  def destroy
  end

  private

  def review_comment_params
    params.require(:review_comments).permit(:comment)
  end

end
