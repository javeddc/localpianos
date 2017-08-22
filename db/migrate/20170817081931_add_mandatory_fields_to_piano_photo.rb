class AddMandatoryFieldsToPianoPhoto < ActiveRecord::Migration[5.1]
  def change
    change_column_null :piano_photos, :piano_id, false
    change_column_null :piano_photos, :image_url, false
    change_column_null :piano_photos, :user_id, false
  end
end
