require 'project'

describe '#my_uniq' do 
  let (:first_arr) { [1, 2, 1, 3, 3] }
  it 'returns unique elements' do 
    expect(my_uniq(first_arr)).to eq([1,2,3])
  end 

  it "doesn't modify first arr" do 
    my_uniq(first_arr)
    expect(first_arr).to be(first_arr)
  end 
end 