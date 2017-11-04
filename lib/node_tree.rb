class NodeTree
  attr_reader :tree

  delegate :id, :name, to: :tree

  def initialize(tree)
    @tree = tree
  end

  def roots_width
    return 0 if levels.first.empty?
    levels.first.sum(&:width)
  end

  def levels
    @levels ||= begin
      levels_ary = []
      level = -1
      begin
        level += 1
        levels_ary << nodes.select{ |node| node.level == level }
      end until levels_ary[level].empty?
      levels_ary
    end
  end

  def nodes
    @nodes ||= begin
      tree.roots.collect do |root|
        node = Node.new(root, nil)
        ([node] + traverse_branch(node)).flatten
      end.flatten
    end
  end

  def traverse_branch(parent)
    return blank_node(parent) if parent.children.empty?
    branch_nodes = parent.children.collect do |child|
      node = Node.new(child, parent)
      ([node] + traverse_branch(node)).flatten
    end.flatten
    parent.finished!
    branch_nodes
  end

  def blank_node(parent)
    blanks = []
    (1..10).each do
      blanks << Node.new(nil, (blanks.last || parent))
    end
    parent.finished!
    blanks
  end
end
