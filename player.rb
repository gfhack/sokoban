class Player
 attr_reader :x, :y
 
 def initialize(x, y)
    @x = x
    @y = y
 end
 
 def position
    return {x: [@x], y: [@y]}
 end
end
