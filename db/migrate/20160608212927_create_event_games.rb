class CreateEventGames < ActiveRecord::Migration
  def change
    create_table :event_games do |t|
      t.integer :game_id, null: false
      t.integer :event_id, null: false
      
      t.timestamps null: false
    end
  end
end
