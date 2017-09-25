class TreesOwnedByUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :trees, :user_id, :integer
  end
end
