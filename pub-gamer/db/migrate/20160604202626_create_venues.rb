class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name, null: false
      t.string :address, null: false, unique: true
      t.text :description
      t.boolean :deleted
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
