class KnightPathFinder
  attr_accessor :root_node, :considered_pos

  def self.board_generator(n)
    arr = []
    (0..n).each do |i|
      (0..n).each do |j|
        arr.push([i, j])
      end
    end
    arr
  end

  @@board_pos = KnightPathFinder.board_generator(7)



  def initialize(start_pos)#
    @root_node = PolyTreeNode.new(start_pos)
    @considered_pos = [start_pos]
    self.build_move_tree
  end

  def self.valid_moves(pos)
    x, y = pos
    valid = [[x+2, y+1], 
    [x+2, y-1], 
    [x+1, y+2], 
    [x+1, y-2], 
    [x-1, y+2], 
    [x-1, y-2], 
    [x-2, y+1], 
    [x-2, y-1]]
    valid.select { |pos| @@board_pos.include?(pos) }
  end

  def new_move_positions(pos)
    new_pos = KnightPathFinder.valid_moves(pos) - considered_pos
    considered_pos.concat(new_pos)
    new_pos
  end

  def build_move_tree
    qeueu = [root_node]
    until qeueu.empty?
      new_move_positions(qeueu[0].value).map do |positions|
        qeueu[0].add_child(PolyTreeNode.new(positions))
      end
      qeueu.concat(qeueu.shift.children)
    end
  end

  def find_path(end_pos)
    var = root_node.dfs(end_pos)
    var.traceback_path
  end



end

class PolyTreeNode

  attr_accessor :children, :value
  attr_reader :parent

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    self.parent.children.delete(self) unless self.parent.nil?
    if node.nil?
      @parent = nil
    else
      @parent = node
      unless node.children.include?(self)
        node.children << self
      end
    end
  end

  def add_child(node)
    node.parent = self
  end

  def remove_child(node)
    if !self.children.include?(node)
      raise
    else
      self.children.delete(node)
    end
    node.parent = nil
  end

  def dfs(value)
    return self if self.value == value
  
    self.children.each do |child|
      search = child.dfs(value)
      return search unless search.nil?
    end
    nil
  end

  def traceback_path
    path = []
    root = self.parent
    until root.parent.nil?
      path.unshift(root.parent)
      root = path[0].parent
    end
    return path
  end

  def inspect
    value
  end

end

kpf = KnightPathFinder.new([0, 0])
# kpf.build_move_tree
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]

p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]
