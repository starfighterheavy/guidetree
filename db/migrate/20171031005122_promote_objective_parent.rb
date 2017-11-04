class PromoteObjectiveParent < ActiveRecord::Migration[5.1]
  def change
    add_column :objectives, :parent_id, :integer
  end
end
