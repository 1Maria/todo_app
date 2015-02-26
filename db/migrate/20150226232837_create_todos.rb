class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.text :text
      t.string :complete
      t.integer :order
      t.date :due_on
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
