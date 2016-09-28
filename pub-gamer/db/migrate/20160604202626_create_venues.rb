class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name, null: false
      t.string :address, null: false, unique: true
      t.string :place, unique: true
      t.boolean :deleted, null: false, default: false
      t.integer :neighborhood_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
