class CreateHotels < ActiveRecord::Migration[5.2]
  def change
    create_table :hotels do |t|

      t.timestamps
      t.integer :category_id, null: false
      t.integer :area_id, null: false
      t.string :hotel_name, null: false
      t.string :price_range, null: false
      t.text :caption, null: false
      t.text :website, null: false
      t.string :address, null: false
    end
  end
end
