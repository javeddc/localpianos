class AddMandatoryFieldsToComment < ActiveRecord::Migration[5.1]
  def change
    change_column_null :comments, :piano_id, false
    change_column_null :comments, :user_id, false
    change_column_null :comments, :body, false
  end
end
