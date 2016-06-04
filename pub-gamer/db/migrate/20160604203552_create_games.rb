class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name, null: false
      t.text :description
      t.integer :quantity
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
