class AddShareableLinkGuid < ActiveRecord::Migration[5.1]
  def change
    add_column :trees, :public_uuid, :string
  end
end
