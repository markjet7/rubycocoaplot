# plot.rb
# rubyplot
#
# Created by Mark Mba Wright on 5/20/11.
# Copyright 2011 MIT. All rights reserved.

class Axes < NSView
# The Axes contains most of the figure elements including multiple 
# axis, tick, lines, text, polygons, plots...
	attr_accessor :x_size, :y_size, :plots
	
	def initWithFrame(frame)
		#NSColor.blackColor().set()
		#self.setBackgroundColor(NSColor.grayColor())
		@x_size = frame.size.width-10
		@y_size = frame.size.height-10
		
		@plots = []
		#@plots << Axis.new.initWithFrame(self.frame)
		#return self
	end
	
	def drawRect(rect)
		puts "hello axes"
	end
	
	def resize(new_x_size, new_y_size)
		@plots.each do |axis|
			#axis.resize_axes(new_x_size - 10, new_y_size - 10)
		end
	end
end
