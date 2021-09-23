class Towersgame 
  attr_accessor :towers 
  def initialize
    @towers = [[4,3,2,1], [], []] 
  end

  def moves(start_pos, end_pos) 
    ring = towers[start_pos].pop 
    towers[end_pos].push(ring)
    
    towers.each.with_index do |tower, i|
      tower.each.with_index do |ring, j|
        if tower[j] < tower[j+1]
          tower[start_pos].push(tower[end_pos].pop)
          raise "Error: larger ring above smaller ring"
        end 
      end
    end 
  end

end