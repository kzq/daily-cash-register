class AddLockableToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :unlock_token, :string
    add_index :users, :unlock_token
    add_column :users, :locked_at, :datetime, unique: true
  end
end