class AddProfileImageStatusToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :profile_image_status, :boolean, default: false, null: false
  end
end
