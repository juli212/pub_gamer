class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, null: false, length: 300
      t.boolean :deleted, null: false, default: false
      t.integer :event_id, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
