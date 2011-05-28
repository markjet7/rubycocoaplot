# dataModel.rb
# rubyplot
#
# Created by Mark Mba Wright on 5/23/11.
# Copyright 2011 MIT. All rights reserved.

class DataModel
	attr_accessor :data
	def initialize(data)
		@data = data
	end

	# Table View Datasource methods
	def tableView(view, objectValueForTableColumn:col, row:index)
		col = col.identifier
		if(index >= 0 && index <= @data.values.count)
			return @data[:"#{col}"][index]
		else
			return nil
		end
	end
	
	def tableView(view, setObjectValue:objectValue, forTableColumn:col, row:index)
		if(index >= 0 && index <= @data.values.count)
			@data["#{col.identifier}"][index] = objectValue
		else
			return nil
		end
		view.reloadData
	end
	
	def numberOfRowsInTableView(view)
		if @data.nil?
			return 0
		else
			@data.values.count
		end
	end
	
	def clickedRowFromMouseDown(sender)
		return mClickedRow()
	end
end
