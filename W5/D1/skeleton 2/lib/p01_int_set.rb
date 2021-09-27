class MaxIntSet

  attr_reader :max
  attr_accessor :store 

  def initialize(max)
    @max = max 
    @store = Array.new(max, false)  
  end

  def insert(num)
    raise "Out of bounds" if num > max || num < 0 
    store[num] = true 
  end

  def remove(num)
    store[num] = false 
  end

  def include?(num)
    @store[num] 
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num 
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % 20] 
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    
    if !include?(num)
      self[num] << num 
      @count += 1
    end 

    resize! if count == num_buckets

  end

  def remove(num)
    if include?(num)
      @count -= 1
      self[num].delete(num) 
    end 
    
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets] 
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    if num_buckets == count 
    
      place_holder = [] 

      @store.each do |bucket|
        bucket.each do |ele|
          self.remove(ele)
          place_holder << ele 
        end 
      end 

      @store += Array.new(num_buckets) {Array.new}
      place_holder.each { |ele| self.insert(ele) } 
    end 

  end
end
