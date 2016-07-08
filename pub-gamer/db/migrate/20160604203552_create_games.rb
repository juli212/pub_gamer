class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name, null: false, unique: true

      t.timestamps null: false
    end
  end
end
