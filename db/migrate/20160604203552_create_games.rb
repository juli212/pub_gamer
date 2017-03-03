class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name, null: false, unique: true, length: 25

      t.timestamps null: false
    end
  end
end
