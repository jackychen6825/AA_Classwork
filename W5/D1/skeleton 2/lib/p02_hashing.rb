class Integer
  # Integer#hash already implemented for you
end

class Array

  def hash 

    hash_values = []
    self.each.with_index do |num, idx|
      hash_values << (num + idx).hash
    end 
    return hash_values.sum 
  end

end

class String
  def hash
    hash_values = []
    alphabet = ("a".."z").to_a

    self.each_char.with_index do |char, idx|
      char = char.downcase 
      hash_values << (alphabet.index(char) + idx).hash
    end 
    hash_values.sum
  end
end

class Hash 
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
  
    hash_values = []
    hash.each do |key, value|
      string = letter_hash(key.to_s) + letter_hash(value)
      hash_values << string 
    end 
    hash_values.sum 
    # 0
  end

  def letter_hash(char)
      alphabet = ("a".."z").to_a
      char = char.downcase 
      alphabet.index(char).hash
  end 

end

