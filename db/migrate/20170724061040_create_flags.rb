class CreateFlags < ActiveRecord::Migration[5.1]
  def change
    create_table :flags do |t|
      t.string :status
      t.string :category
      t.integer :user_id
      t.integer :piano_id
      t.text :body

      t.timestamps
    end
  end
end
