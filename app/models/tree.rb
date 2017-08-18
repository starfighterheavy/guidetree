class Tree < ActiveRecord::Base
  has_many :objectives

  def root_branches
    objectives.where.not(id: Dependency.pluck(:child_id).uniq)
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
    @order += 1
    @branches << Branch.new(nil, parent, @order)
  end

  class Branch
    attr_reader :objective, :parent, :order, :level, :width, :o_id

    def initialize(objective, parent, order)
      @objective = objective || OpenStruct.new
      @parent = parent
      @order = order
      @level = (parent&.level || -1) + 1
      @o_id = object_id
    end

    def id
      @objective.id
    end

    def children
      @objective.children
    end

    def title
      @objective.title
    end

    def description
      @objective.description
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
