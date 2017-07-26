class CreatePianos < ActiveRecord::Migration[5.1]
  def change
    create_table :pianos do |t|
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :category
      t.integer :user_id
      t.text :location_description
      t.text :piano_description
      t.text :access_description

      t.timestamps
    end
  end
end
