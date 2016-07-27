class CreateVibes < ActiveRecord::Migration
  def change
    create_table :vibes do |t|
    	t.string :name, null: false, unique: true
    	t.string :pic

      t.timestamps null: false
    end
  end
end
