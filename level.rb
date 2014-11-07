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
      x = last_pos[:x]
      y = last_pos[:y]

      puts last_pos
      puts x.inspect
      puts y.inspect

      #case direction
      #   when :up
      #      @y--
      #      @level.y @y
      #   when :down
      #      @y++
      #      @level.y @y
      #   when :left
      #      @x--
      #      @level.x @x
      #   when :right
      #      @x++
      #      @level.x @x
      #end

      #@layout[@player.x][@player.y]
      #clear_last_pos(@last_pos)
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
      @layout[last_pos[:x]][last_pos[:y]] = " "
   end

   def find_player
      @layout.each_with_index do |line, x|
         line.each_with_index do |ele, y|
            return Player.new(x, y) if ele == "@"
         end
      end
   end
end