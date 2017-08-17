class AddMandatoryFieldsToPiano < ActiveRecord::Migration[5.1]
  def change
    change_column_null :pianos, :latitude, false
    change_column_null :pianos, :longitude, false
    change_column_null :pianos, :user_id, false
  end
end
