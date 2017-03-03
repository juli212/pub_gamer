class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|
    	t.string :name, null: false, unique: true, limit: 30

      t.timestamps null: false
    end
  end
end
