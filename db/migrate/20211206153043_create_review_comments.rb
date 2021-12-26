class CreateReviewComments < ActiveRecord::Migration[5.2]
  def change
    create_table :review_comments do |t|
      t.timestamps
      t.integer :review_id, null: false
      t.integer :member_id, null: false
      t.text :comment, null: false
    end
  end
end
