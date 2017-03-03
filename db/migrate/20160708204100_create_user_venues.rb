class CreateUserVenues < ActiveRecord::Migration
  def change
    create_table :user_venues do |t|
    	t.integer :user_id, null: false
    	t.integer :venue_id, null: false
    	
      t.timestamps null: false
    end
  end
end
