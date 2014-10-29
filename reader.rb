class Level
 @level

 def initialize
 end

 def read(name)
    File.open("db/#{name}", "r") do |file|
       file.map do |line|
          @level = line.chomp.split("").inspect
       end
    end
 end
end
