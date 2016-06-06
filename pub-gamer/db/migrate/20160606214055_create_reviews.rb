class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title. null: false
      t.string :content, null: false
      t.time :time_visited, null: false
      t.boolean :recommended, null: false
      t.references :venue, false

      t.timestamps null: false
    end
  end
end
