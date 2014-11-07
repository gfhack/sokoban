require './level'
require './player'
require 'minitest/autorun'

describe Level do
	before(:each) do
		@level = Level.new
		@level.read 'db/medium.txt'
	end

	it "should read the file" do
		@level.layout.wont_be_empty
	end

	it "should find the player" do
		@level.player.position.wont_be_empty
	end

	it "should move to empty space" do
		@ini_pos = @level.player.position
		@level.move(:left)
		@level.player.position.wont_equal @ini_pos
	end

	it "should not move to a wall" do
		@ini_pos = @level.player.position
		@level.move(:right)
		@level.player.position.must_equal @ini_pos
	end

	it "should win the game" do
		@level.move(:left)
		@level.move(:left)
		@level.move(:up)
		@level.move(:up)
		@level.move(:up)
		@level.move(:down)
		@level.move(:right)
		@level.move(:right)
		@level.move(:up)
		@level.move(:up)
		@level.move(:left)
		@level.move(:left)
		@level.move(:left)
		@level.move(:right)
		@level.move(:right)
		@level.move(:up)
		@level.move(:left)
		@level.move(:left)

		@level.finished?.must_equal true
	end
end