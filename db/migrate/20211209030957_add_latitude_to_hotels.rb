class AddLatitudeToHotels < ActiveRecord::Migration[5.2]
  def change
    add_column :hotels, :latitude, :float
  end
end
