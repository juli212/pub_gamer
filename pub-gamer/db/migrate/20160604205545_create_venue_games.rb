class CreateVenueGames < ActiveRecord::Migration
  def change
    create_table :venue_games do |t|
      t.integer :game_id, null: false
      t.integer :venue_id, null: false
      
      t.timestamps null: false
    end
  end
end
