require 'byebug'

DIAGONAL = [[1,1], [-1,-1], [1,-1], [-1,1]]
VERTICAL = [[0,1],[0,-1]]
HORIZONTAL = [[1,0], [-1,0]]
module Slidable
 def self.moves(pos, direction)
   moveset = []
   8.times do |num|
     direction.each do |offset|
       buffer = []
       buffer[0] = pos[0]
       buffer[1] = pos[1]
       next if num == 0
       buffer[0] += (offset[0] * num)
       buffer[1] += (offset[1] * num)
       moveset << buffer if !moveset.include?(buffer)
     end
  end
  moveset.select{|e| e[0].between?(0,7) && e[1].between?(0,7)}
 end

end
