class TreesController < ApplicationController
  def show
    generate_tree
  end

  private

  def generate_tree
    @root = Objective.where.not(id: Dependency.select(:parent_id).uniq).first
    @id = 0
    node = Node.new(@root, nil, 0)
    @nodes = [node]
    traverse_branch(node)
  end

  def traverse_branch(parent)
    parent.children.each do |child|
      @id += 1
      node = Node.new(child, parent, @id)
      @nodes << node
      traverse_branch(node)
    end
    parent.finished!
  end

  class Node
    attr_reader :objective, :parent, :id, :level, :width, :o_id

    def initialize(objective, parent, id)
      @objective = objective
      @parent = parent
      @id = id
      @level = (parent&.level || -1) + 1
      @o_id = object_id
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
