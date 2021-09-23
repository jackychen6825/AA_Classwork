
def my_uniq(arr)
  count = Hash.new(0)

  arr.each do |ele|
    count[ele] += 1
  end 
  
  count.keys
end 

