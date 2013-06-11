Usage:

1) Start hbase shell

    hbase/bin> ./hbase shell

2) Require/Load the .rb file, example

    hbase(main):009:0> require '<path>/delete_row_by_pattern.rb'


1. delete_row_by_pattern :
	Deletes those rows whose values starts with a pattern  (below example deletes those rows which starts with TW_)
	 
        hbase(main):009:0> @hbase.table('hbase_table1',nil).delete_row_by_pattern!( {COLUMNS => 'articles:content', STARTROW => 'TW_'} )
            
