class Objective < ActiveRecord::Base
  belongs_to :tree
  belongs_to :parent, class_name: "Objective", optional: true
  has_many :children, foreign_key: "parent_id", class_name: "Objective"
  has_many :parent_relationships, class_name: :Dependency, foreign_key: :parent_id
  has_many :child_relationships, class_name: :Dependency, foreign_key: :child_id
  has_many :other_parents, through: :child_relationships
  has_many :other_children, through: :parent_relationships
  has_many :objective_traits

  before_validation do
    if parent
      self.tree = parent.tree
    end
  end

  before_destroy :check_for_children

  def self.roots
    where(parent_id: nil).where.not(id: Dependency.pluck(:child_id).uniq)
  end

  def potential_parents
    tree.objectives
        .select { |o| o.id != id }
        .map { |o| [o.title, o.id] }
  end

  def completed?
    completed_at.present?
  end

  private

  def check_for_children
    return if Dependency.where(parent: self).empty? && children.empty?
    errors[:base] << "Objective cannot be deleted while it has children"
    throw :abort
  end
end
