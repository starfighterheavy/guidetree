class TreesController < ApplicationController
  def show
    generate_tree
  end

  private

  def generate_tree
    @root = Objective.where.not(id: Dependency.select(:parent_id).uniq).first
    @order = 0
    node = Node.new(@root, nil, 0)
    @nodes = [node]
    traverse_branch(node)
  end

  def traverse_branch(parent)
    add_blank_node(parent) if parent.children.empty?
    parent.children.each do |child|
      @order += 1
      node = Node.new(child, parent, @order)
      @nodes << node
      traverse_branch(node)
    end
    parent.finished!
  end

  def add_blank_node(parent)
    @order += 1
    @nodes << Node.new(nil, parent, @order)
  end

  class Node
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
