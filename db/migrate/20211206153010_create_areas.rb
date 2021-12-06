class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|

      t.timestamps
      t.string :area_name, null: false
    end
  end
end
