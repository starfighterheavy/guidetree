class Setup < ActiveRecord::Migration[5.1]
  def change
    create_table :objectives do |t|
      t.string :title
      t.text :description
      t.datetime :completed
      t.integer :category_id
      t.timestamps
    end

    create_table :categories do |t|
      t.string :title
      t.text :description
      t.string :color
      t.timestamps
    end

    create_table :dependencies do |t|
      t.integer :parent_id
      t.integer :child_id
      t.timestamps
    end

    create_table :traits do |t|
      t.string :title
      t.text :description
      t.timestamps
    end

    create_table :objective_traits do |t|
      t.integer :objective_id
      t.integer :trait_id
      t.integer :amount
    end
  end
end
