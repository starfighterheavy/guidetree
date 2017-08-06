class Objective < ActiveRecord::Base
  has_many :parent_relationships, class_name: :Dependency, foreign_key: :parent_id
  has_many :child_relationships, class_name: :Dependency, foreign_key: :child_id
  has_many :parents, through: :child_relationships
  has_many :children, through: :parent_relationships
  has_many :objective_traits
end
