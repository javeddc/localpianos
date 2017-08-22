class AddMandatoryFieldsToStar < ActiveRecord::Migration[5.1]
  def change
    change_column_null :stars, :piano_id, false
    change_column_null :stars, :user_id, false
  end
end
