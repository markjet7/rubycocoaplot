# painter.rb
# rubyplot
#
# Created by Mark Mba Wright on 5/18/11.
# Copyright 2011 MIT. All rights reserved.

class Painter < NSView
	attr_accessor :plot
	
	def awakeFromNib()
		#self.setAutoresizesSubviews(TRUE)
	end
	
	#def draw_example(data)
		#self.setSubviews([NSView.alloc.initWithFrame(self.frame)])
		#@plot = Axes.new.initWithFrame(self.frame)
		#self.addSubview(@plot)
		#xy = Plot_xy.new(@plot.axes[0])
		#@plot.axes[0].graphs << xy
		#@plot.axes[0].add_x_label("x axis", self)
		#@plot.axes[0].add_y_label("y axis", self)
	#end
	
	def drawRect(rect)
		NSColor.whiteColor().set()
		NSBezierPath.fillRect(rect)
		
		#self.itemColor().set()
		
#		self.lockFocus

#		self.unlockFocus
		#draw_line_with_points(1.0, 1.0, 100.0, 150.0)
	end
	
	def resizeSubviewsWithOldSize(oldSize)
		@plot.resize(self.frame.size.width, self.frame.size.height)
	end
end
