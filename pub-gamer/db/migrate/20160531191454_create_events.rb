class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.date :date, null: false
      t.time :time, null: false
      # t.string :location, null: false
      t.integer :limit, null: false
      t.boolean :deleted, null: false, default: false
      t.integer :user_id, null: false
      t.integer :venue_id, null: false

      t.timestamps null: false
    end
  end
end
