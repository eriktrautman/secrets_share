class CreateSecrets < ActiveRecord::Migration
  def change
    create_table :secrets do |t|
      t.integer :user_id
      t.text :text

      t.timestamps
    end
  end
end
