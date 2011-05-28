# plot_xy.rb
# rubyplot
#
# Created by Mark Mba Wright on 5/20/11.
# Copyright 2011 MIT. All rights reserved.

class Plot_xy
	attr_accessor :data, :axis
	def initialize(axis)
		@data = {:x => [0,10], :y => [0,40]}
		@axis = axis
	end
	
	def draw
		(0..@data.values.count).each do |index|
			NSColor.blackColor.set
			rect = NSMakeRect(@data[:x][index]+@axis.x[:min], @data[:y][index]+@axis.y[:min], 3, 3)
			NSRectFill(rect)
		end
	end
end
