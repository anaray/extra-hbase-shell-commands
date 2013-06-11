require "hbase"
require "hbase/table"


class Hbase::Table

  def delete_by_pattern!(args = {})
        self.scan(args) do |row, cells|
          self.delete(row, args['COLUMNS'])
          puts "succesfully deleted row #{row}"
     end
  end

end
