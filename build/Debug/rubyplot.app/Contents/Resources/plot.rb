# plot.rb
# rubyplot
#
# Created by Mark Mba Wright on 5/20/11.
# Copyright 2011 MIT. All rights reserved.

class Plot
# The Plot class has multiple axis
	attr_accessor :x_size, :y_size, :axes
	def initialize(x_size = 100, y_size = 100)
		@x_size = x_size
		@y_size = y_size
		
		@axes = []
		@axes << Axis.new(@x_size, @y_size)
	end
	
	def draw
		@axes.each do |axis|
			axis.draw()
		end
	end
end
