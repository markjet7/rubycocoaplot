# axis.rb
# rubyplot
#
# Created by Mark Mba Wright on 5/20/11.
# Copyright 2011 MIT. All rights reserved.

class Axis < NSView
	attr_accessor :x, :y, :graphs, :x_label, :y_label
	def initWithFrame(frame)
		@x = {}
		@y = {}
		@x[:min] = 30
		@y[:min] = 30
		@x[:max] = frame.size.width
		@y[:max] = frame.size.height
		
		@x[:major_ticks] = (0..100).step(10)
		@y[:major_ticks] = (0..100).step(10)
		@graphs = []
		
		@x_label = NSTextView.alloc.initWithFrame(NSMakeRect(0, 0, 0, 0))
		@y_label = NSTextView.alloc.initWithFrame(NSMakeRect(0, 0, 0, 0))
	end
	
	def drawRect(rect)
		self.lockFocus
			draw_axis
			draw_graphs
		self.unlockFocus
	end
	
	def draw_axis
		NSColor.blackColor().setStroke
	
		aPath = NSBezierPath.bezierPath
		aPath.moveToPoint(NSMakePoint(@x[:min], @y[:min]))
		aPath.lineToPoint(NSMakePoint(@x[:min], @y[:max]))
		aPath.moveToPoint(NSMakePoint(@x[:min], @y[:min]))
		aPath.lineToPoint(NSMakePoint(@x[:max], @y[:min]))
		
		@x[:major_ticks].each do |tick|
			location = @x[:min] + (@x[:max] - @x[:min])*tick/@x[:major_ticks].max
			aPath.moveToPoint(NSMakePoint(location, @y[:min]))
			aPath.lineToPoint(NSMakePoint(location, @y[:min]-5))
		end
		
		@y[:major_ticks].each do |tick|
			location = @y[:min] + (@y[:max] - @y[:min])*tick/@y[:major_ticks].max
			aPath.moveToPoint(NSMakePoint(@x[:min], location))
			aPath.lineToPoint(NSMakePoint(@x[:min]-5.0, location))
		end
		
		aPath.stroke
	end
	
	def draw_graphs
		@graphs.each do |graph|
			graph.draw
		end
	end
	
	def add_x_label(text, view)
		@x_label = NSTextView.alloc.initWithFrame(NSMakeRect(@x[:min], 0, @x[:max] - @x[:min], 15))
		@x_label.setFont(NSFont.fontWithName("Helvetica", size:12.0))
		@x_label.setTextColor(NSColor.grayColor)
		@x_label.setBackgroundColor(NSColor.blueColor)
		@x_label.setDrawsBackground(FALSE)
		
		@x_label.alignCenter(@x_label)
		@x_label.insertText(text)
		
		view.addSubview(@x_label)
	end
	
	def add_y_label(text, view)		
		@y_label = NSTextView.alloc.initWithFrame(NSMakeRect(0,  @y[:min], @y[:max]-@y[:min], 15 ))
		@y_label.rotateByAngle(-90)
		@y_label.setBackgroundColor(NSColor.blueColor)
		@y_label.setDrawsBackground(FALSE)
		@y_label.setFont(NSFont.fontWithName("Helvetica", size:12.0))
		@y_label.setTextColor(NSColor.grayColor)
		@y_label.alignCenter(@y_label)
		@y_label.insertText(text)
		
		view.addSubview(@y_label)
	end
	
	def resize_axes(new_x_size, new_y_size)
		@x[:max] = new_x_size 
		@y[:max] = new_y_size
		@x_label.textContainer.setContainerSize([@x[:max] - @x[:min], 15])
		@y_label.textContainer.setContainerSize([@y[:max] - @y[:min], 15])		
	end
end
