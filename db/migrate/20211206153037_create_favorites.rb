class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|

      t.timestamps
      t.integer :hotel_id, null: false
      t.integer :member_id, null: false
    end
  end
end
