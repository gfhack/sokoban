class Level
   attr_accessor :layout, :player

   def initialize
      @layout = Array.new
   end

   def read(name)
      map = Array.new

      File.open("#{name}", "r") do |file|
         file.map do |line|
            map << line.chomp
         end
      end

      map.each do |line|
         @layout << line.split("")
      end

      @player = find_player
   end

   def move(direction)
      last_pos = @player.position
      x = last_pos[:x][0]
      y = last_pos[:y][0]

      case direction
         when :up
            unless @layout[x-1][y] == "#"
               @player.x = (x-1)
            end
         when :down
            unless @layout[x+1][y] == "#"
               @player.x = (x+1)
            end
         when :left
            unless @layout[x][y-1] == "#"
               @player.y = (y-1)
            end
         when :right
            unless @layout[x][y+1] == "#"
               @player.y = (y+1)
            end
      end

      @layout[@player.x][@player.y] = "@"

      unless @player.x == x && @player.y == y
         clear_last_pos(last_pos) 
      end
   end

   def finished?
      return false
   end

   def draw
      @layout.each do |line|
         line.each do |ele|
            print ele
         end
         print "\n"
      end
   end

   private

   def clear_last_pos(last_pos)
      @layout[last_pos[:x][0]][last_pos[:y][0]] = " "
   end

   def find_player
      @layout.each_with_index do |line, x|
         line.each_with_index do |ele, y|
            return Player.new(x, y) if ele == "@"
         end
      end
   end
end