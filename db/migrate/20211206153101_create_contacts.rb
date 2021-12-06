class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|

      t.timestamps
      t.string :name, null: false
      t.string :email, null: false
      t.string :subject
      t.text :message, null: false
    end
  end
end
