class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :content, null: false, limit: 500
      t.string :week, limit: 15
      t.integer :rating, inclusion: 1..5, null: false
      t.boolean :deleted, null: false, default: false
      t.integer :venue_id, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
