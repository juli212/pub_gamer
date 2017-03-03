class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, length: 100, null: false
      t.text :description, length: 500, null: false
      t.date :date, null: false
      t.time :time, null: false
      t.integer :limit, inclusion: 0..40, null: false
      t.boolean :deleted, null: false, default: false
      t.integer :user_id, null: false
      t.integer :venue_id, null: false

      t.timestamps null: false
    end
  end
end
