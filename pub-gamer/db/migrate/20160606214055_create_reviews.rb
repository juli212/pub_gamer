class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :content, null: false
      t.string :vibe, null: false
      t.time :time_visited
      t.boolean :recommended
      t.integer :venue_id, null: false

      t.timestamps null: false
    end
  end
end
