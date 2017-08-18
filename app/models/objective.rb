class Objective < ActiveRecord::Base
  belongs_to :tree
  has_many :parent_relationships, class_name: :Dependency, foreign_key: :parent_id
  has_many :child_relationships, class_name: :Dependency, foreign_key: :child_id
  has_many :parents, through: :child_relationships
  has_many :children, through: :parent_relationships
  has_many :objective_traits

  before_destroy :check_for_children

  validate :parent_self_assignment

  after_commit do
    next unless @parent_id.present?
    parent = Objective.find(@parent_id)
    Dependency.where(child: self).destroy_all
    Dependency.create!(child: self, parent: parent)
  end

  def parent_id=(parent_id)
    @parent_id = parent_id
  end

  def parent_id
    parents.first&.id
  end

  private

  def parent_self_assignment
    return unless @parent_id.to_i == id
    errors[:base] << "Objective cannot be a parent of itself"
    throw :abort
  end

  def check_for_children
    return unless Dependency.where(parent: self).any?
    errors[:base] << "Objective cannot be deleted while it has children"
    throw :abort
  end
end
