class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
    	t.text		:content, null: false
      t.string  :name, default: nil
      t.string  :email, default: nil
      t.integer :topic, null: false, default: 1
    	t.integer	:status, null: false, default: 0
    	t.integer :user_id, default: nil
      t.integer :venue_id, default: nil

      t.timestamps null: false
    end
  end
end
