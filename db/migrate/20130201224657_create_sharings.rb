class CreateSharings < ActiveRecord::Migration
  def change
    create_table :sharings do |t|
      t.integer :sharer_id
      t.integer :friend_id

      t.timestamps
    end
  end
end
