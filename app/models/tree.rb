class Tree < ActiveRecord::Base
  has_many :objectives

  def root_branches
    objectives.roots
  end

  def levels
    @levels || generate_levels
  end

  def generate_levels
    @levels = []
    level = -1
    begin
      level += 1
      @levels << branches_at_level(level)
    end until @levels[level].empty?
    @levels
  end

  def branches_at_level(level)
    branches.select{ |branch| branch.level == level }
  end

  def branches
    @branches || generate_branches
  end

  def generate_branches
    @order = -1
    @branches = []
    root_branches.each do |root|
      @order += 1
      branch = Branch.new(root, nil, @order)
      @branches << branch
      traverse_branch(branch)
    end
    @branches
  end

  def traverse_branch(parent)
    add_blank_branch(parent) if parent.children.empty?
    parent.children.each do |child|
      @order += 1
      branch = Branch.new(child, parent, @order)
      @branches << branch
      traverse_branch(branch)
    end
    parent.finished!
  end

  def add_blank_branch(parent)
    (1..10).each do
      @order += 1
      @branches << Branch.new(nil, @branches.last, @order)
    end
  end

  class Branch
    attr_reader :objective, :parent, :order, :level, :width, :o_id

    delegate :completed?, :id, :children, :title, :description, to: :objective

    def initialize(objective, parent, order)
      @objective = objective || OpenStruct.new
      @parent = parent
      @order = order
      @level = (parent&.level || -1) + 1
      @o_id = object_id
    end

    def finished!
      @width ||= 1
      parent&.update_width(@width)
    end

    def update_width(child_width)
      @width = (@width || 0) + child_width
    end
  end
end
