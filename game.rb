require 'highline/import'
require 'highline/system_extensions'
include HighLine::SystemExtensions
require './level'
require './player'

@level = Level.new
@end = false

choose do |menu|
	menu.prompt = "Choose your destiny:"

	Dir.glob("db/*.txt").map do |name|
		menu.choice(%Q$:#{name}$) { @level.read(%Q$#{name}$) }
	end
end

until @end or @level.finished?
	@level.draw
	choose do |menu|
		menu.choice(:up)    { @level.move(:up) }
		menu.choice(:down)  { @level.move(:down) }
		menu.choice(:left)  { @level.move(:left) }
		menu.choice(:right) { @level.move(:right) }
		menu.choice(:quit)  { @end = true }
	end
end
