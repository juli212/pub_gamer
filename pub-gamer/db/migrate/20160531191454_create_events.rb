class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.date :event_date, null: false
      t.time :event_time, null: false
      t.integer :limit, null: false
      t.integer :venue_id, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
