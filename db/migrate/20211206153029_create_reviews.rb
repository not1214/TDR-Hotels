class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|

      t.timestamps
      t.integer :hotel_id, null: false
      t.integer :member_id, null: false
      t.string :title, null: false
      t.text :content
      t.string :review_image_id
      t.float :rate, null: false
    end
  end
end
