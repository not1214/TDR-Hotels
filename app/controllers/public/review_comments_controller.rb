class Public::ReviewCommentsController < ApplicationController

  before_action :authenticate_member!

  def create
    @review = Review.find(params[:review_id])
    @comment = current_member.review_comments.new(review_comment_params)
    @comment.review_id = @review.id
    if @comment.save
      flash.now[:notice] = "コメントを送信しました。"
    else
      flash.now[:alert] = "コメントを送信できませんでした。再度入力してください。"
      render "error"
    end
  end

  def destroy
    @review = Review.find(params[:review_id])
    ReviewComment.find_by(id: params[:id]).destroy
    flash[:notice] = "コメントを削除しました。"
  end

  private

  def review_comment_params
    params.require(:review_comment).permit(:comment)
  end

end
