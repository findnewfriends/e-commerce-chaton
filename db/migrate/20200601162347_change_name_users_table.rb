class ChangeNameUsersTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :users, :user
  end
end
