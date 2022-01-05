class AddReviewImageStatusToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :review_image_status, :boolean, default: false, null: false
  end
end
