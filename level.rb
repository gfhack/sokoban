class Level
 attr_accessor :layout, :player

 def initialize
    @layout = Array.new
 end

 def read(name)
    @map = Array.new

    File.open("#{name}", "r") do |file|
       file.map do |line|
          @map << line.chomp
       end
    end
    
    @map.each do |line|
       @layout << line.split("")
    end
    #@player = Player.new
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
end
