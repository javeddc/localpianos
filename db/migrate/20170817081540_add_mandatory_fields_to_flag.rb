class AddMandatoryFieldsToFlag < ActiveRecord::Migration[5.1]
  def change
    change_column_null :flags, :status, false
  end
end
