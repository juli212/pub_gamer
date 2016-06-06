class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name, null: false
      t.text :description
      t.string :neighborhood, null: false
      t.string :address, null: false
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
