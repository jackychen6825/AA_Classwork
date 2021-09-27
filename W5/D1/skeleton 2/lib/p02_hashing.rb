class Integer
  # Integer#hash already implemented for you
  self.hash
end

class Array

  def hash #[1,2,3]
  integers = self.map { |ele| ele.to_i }
  hash = integers.shift
  integers.each do |num|
    hash = (hash ^ num).to_s(2).to_i
  end

  hash
  end
end

class String
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
