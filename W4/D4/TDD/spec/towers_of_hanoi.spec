require 'towers_of_hanoi'

describe TowersGame do
  subject(:tower){TowersGame.new}
  describe initialize do 
    it 'creates new towers' do
      expect(tower.towers).to eq{[[4,3,2,1], [], []]}
    end
  end
  # subjects(:towers) {}
  # [1,2,3,4].reverse.each do |i|
  #   towers[0] << i
  # end

  describe '#move' do 
    it 'move a ring' do 
      expect(tower.move(0, 2))
    end
  end

end

