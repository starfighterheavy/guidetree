class TraitsOwnedByUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :traits, :user_id, :integer
  end
end
