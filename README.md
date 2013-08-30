Usage:

1) Start hbase shell

    hbase/bin> ./hbase shell

2) Require/Load the .rb file, example

    hbase(main):009:0> require '<path>/delete_row_by_pattern.rb'


1. delete_row_by_pattern :
	Deletes rows using regex pattern  (below example deletes those rows which starts with bmw_m5, bmw_m3 )
	 
        hbase(main):009:0> @hbase.table('cars',nil).delete_row_by_pattern!("bmw_m5",COLUMNS=>'make')

        hbase(main):009:0> @hbase.table('cars',nil).delete_row_by_pattern!("bmw_m[\d]",COLUMNS=>'make')
            
        
