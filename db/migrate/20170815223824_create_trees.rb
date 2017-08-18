class CreateTrees < ActiveRecord::Migration[5.1]
  def change
    create_table :trees do |t|
      t.string :name
      t.timestamps
    end

    add_column :objectives, :tree_id, :integer
  end
end
