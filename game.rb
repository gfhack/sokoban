require 'highline/import'
require 'highline/system_extensions'
include HighLine::SystemExtensions
require './level'
require './player'

@level = Level.new
@end = false
#w = get_character
#puts w

choose do |menu|
   menu.prompt = "Choose your destiny:"
   
   Dir.glob("db/*.txt").map do |name|
      menu.choice(%Q$:#{name}$) { @level.read(%Q$#{name}$) }
   end
end

@level.draw

until @end or @level.finished?
   menu.choice(:up)    { }
   menu.choice(:down)  { }
   menu.choice(:left)  { }
   menu.choice(:right) { }
end
