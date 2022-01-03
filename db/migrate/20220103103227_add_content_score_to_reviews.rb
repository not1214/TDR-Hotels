class AddContentScoreToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :content_score, :decimal, precision: 5, scale: 3
  end
end
