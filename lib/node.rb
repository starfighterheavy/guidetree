class Node
  attr_reader :objective, :parent, :level, :width, :o_id

  delegate :objective_traits, :completed?, :id, :children, :title, :description, to: :objective

  def initialize(objective, parent)
    @objective = objective || OpenStruct.new
    @parent = parent
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

