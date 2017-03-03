class CreateUserReports < ActiveRecord::Migration
  def change
    create_table :user_reports do |t|
    	t.integer	:topic, null: false, default: 1
    	t.text		:content, null: false
    	t.integer	:status, null: false, default: 0
    	t.integer	:venue_id, null: false
    	t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
