class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :first_name, null: false, length: 50
      t.string  :last_name, null: false, length: 50
      t.string	:user_name, null:false, unique: true, length: 50
      t.string	:password_digest, null: false
      t.string	:email, null: false, unique: true, length: 100
      t.date    :birthday, null: false
      t.text		:bio, length: 200
      t.boolean :deleted, null: false, default: false

      t.timestamps null: false
    end
  end
end
