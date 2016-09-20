require 'byebug'


module Steppable
 def self.moves(pos, direction)
   moveset = []

   direction.each do |offset|
     buffer = []

     buffer[0] = pos[0]
     buffer[1] = pos[1]


     buffer[0] += (offset[0])
     buffer[1] += (offset[1])
     moveset << buffer if !moveset.include?(buffer)
   end
   moveset.select{|e| e[0].between?(0,7) && e[1].between?(0,7)}
 end
end

# p Steppable.moves([0,0], KING_MOVE)
