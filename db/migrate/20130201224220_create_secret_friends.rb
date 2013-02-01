class CreateSecretFriends < ActiveRecord::Migration
  def change
    create_table :secret_friends do |t|

      t.timestamps
    end
  end
end
