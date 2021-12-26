class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.timestamps
      t.string :image_id, null: false
      t.string :image_name, null: false
    end
  end
end
