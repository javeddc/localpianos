class CreatePianoPhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :piano_photos do |t|
      t.integer :piano_id
      t.text :image_url
      t.text :caption
      t.integer :user_id

      t.timestamps
    end
  end
end
