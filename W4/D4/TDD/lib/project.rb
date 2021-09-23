class Array

  def my_uniq
    count = Hash.new(0)

    self.each do |ele|
      count[ele] += 1
    end 
  
    count.keys
  end 

  def two_sum
    pairs = []
    self.each.with_index do |num1, i1|
      self.each.with_index do |num2, i2|
        if i2 > i1 && num1 + num2 == 0
          pairs << [i1, i2]
        end
      end
    end
    return pairs
  end

  def my_transpose
    transposed = []
    (0...self.length).each do |col_idx|
      place_holder = []
      (0...self.length).each do |row_idx|
        place_holder << self[row_idx][col_idx]
      end
      transposed << place_holder
    end
    transposed
  end

end
