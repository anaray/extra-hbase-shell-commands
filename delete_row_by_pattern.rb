require "hbase"
require "hbase/table"


class Hbase::Table

	def delete_row_by_pattern!(pattern,args = {})
		raise(ArgumentError, "invalid pattern") if pattern.nil?
		keyRegEx = org.apache.hadoop.hbase.filter.RegexStringComparator.new(pattern)
		scan = org.apache.hadoop.hbase.client.Scan.new
		scan.setFilter(org.apache.hadoop.hbase.filter.RowFilter.new(org.apache.hadoop.hbase.filter.CompareFilter::CompareOp::EQUAL, keyRegEx))

		# Run the scanner
		scanner = @table.getScanner(scan)
		iterator = scanner.iterator
		# Iterate results
		while iterator.hasNext
			row = iter.next
			self.delete(row, args['COLUMNS'])
			puts  "succesfully deleted row #{row}"
		end
	end

end

