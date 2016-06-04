class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name, null: false
      t.text :description
      t.string :address, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
