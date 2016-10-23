class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string	:user_name, null:false, unique: true
      t.string	:password_digest, null: false
      t.string	:email, null: false, unique: true
      t.integer	:age
      t.text		:bio

      t.timestamps null: false
    end
  end
end
