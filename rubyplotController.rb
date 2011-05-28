# tableViewController.rb
# rubyplot
#
# Created by Mark Mba Wright on 5/22/11.
# Copyright 2011 MIT. All rights reserved.

class RubyplotController < NSWindowController
	attr_accessor :dataTable, :painter, :current_plot, :cols, :views
	
	def awakeFromNib()
		@dataTable.dataSource = DataModel.new({:x => [], :y => []})
		#@dataTable.setTarget(self)
		@axes = []
		@views = []
	end
	
	def plot(sender)
		if @painter.plot.nil?
			puts "new Plot"
			@views << Axes.alloc.initWithFrame(@painter.frame)
			@painter.addSubview(@views.last)
		end
		#@current_plot = @painter.plot.axes[0].graphs[0]
		
		#@cols = @dataTable.dataSource.data.keys 
		#@cols.each do |col|
		#	new_col = NSTableColumn.alloc.initWithIdentifier(col)
		#	new_col.headerCell.setStringValue(col)
		#	@dataTable.addTableColumn(new_col)
		#end
	end
	
	def draw_example(sender)
	
	end
	
end
