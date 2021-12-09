class AddLongitudeToHotels < ActiveRecord::Migration[5.2]
  def change
    add_column :hotels, :longitude, :float
  end
end
