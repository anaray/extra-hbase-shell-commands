require "hbase"
require "hbase/table"


class Hbase::Table

        def delete_row_by_pattern!(regex_pattern,args = {})
                raise(ArgumentError, "invalid pattern!") if regex_pattern.nil?
                raise(ArgumentError, "missing column/s!") if not args.has_key?("COLUMNS")
                keyRegEx = org.apache.hadoop.hbase.filter.RegexStringComparator.new(regex_pattern)
                scan = org.apache.hadoop.hbase.client.Scan.new
                scan.setFilter(org.apache.hadoop.hbase.filter.RowFilter.new(org.apache.hadoop.hbase.filter.CompareFilter::CompareOp::EQUAL, keyRegEx))

                # Run the scanner
                scanner = @table.getScanner(scan)
                iterator = scanner.iterator
                # Iterate results
                while iterator.hasNext
                        row = iterator.next
                        row_string = java.lang.String.new(row.getRow)
                        d = org.apache.hadoop.hbase.client.Delete.new(row.getRow, org.apache.hadoop.hbase.HConstants::LATEST_TIMESTAMP )
                        @table.delete(d)
                        puts  "succesfully deleted row #{row_string}"
                end
        end
end

