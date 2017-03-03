class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name, null: false, length: 150
      t.string :address, null: false, length: 150
      t.string :place, unique: true
      t.string :lat, null: false
      t.string :lng, null: false
      t.boolean :deleted, null: false, default: false
      t.integer :neighborhood_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
