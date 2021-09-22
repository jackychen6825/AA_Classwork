class PolyTreeNode

  attr_reader :parent, :children, :value 

  def initialize(value)
    @value = value 
    @parent = nil 
    @children = []
  end 

  def parent=(parent_name)
    
    if parent_name != nil 
      if @parent == nil 
        @parent = parent_name
        parent_name.children << self 
      else 
        @parent.children.delete(self)
        @parent = parent_name
        parent_name.children << self
      end 
    else 
      @parent = parent_name 
    end 
  
  end 

  def add_child(child_name)
    child_name.parent = self 
  end 

  def remove_child(child_name)
    child_name.parent = nil
    raise "error" if !@children.include?(child_name)
  end 

  def dfs(target)
    return self if self.value == target
    return nil if self.children.empty? 

    self.children.each do |child|
      res = child.dfs(target)
      return res if res 
    end 

    nil 
  end 

  def bfs(target)
    queue = [self] 
    until queue.empty?
      current = queue.shift 
      return current if current.value == target
      current.children.each do |child|
        queue << child 
      end 
    end 
    nil 
  end 

end




# a = "a"

# b = "b"
# c = "c"

# b.parent = a
# c.parent = a