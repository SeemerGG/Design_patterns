class Data_table
    attr_accessor :table
    attr_reader :count_line, :count_column

    def initialize(entiti)
        self.table = entiti
        @count_column = table[0].count
        @count_line = table.count
    end

    def value(i, j)
        return self.table[i][j]
    end

    def to_s
        str = ""
        self.table.each {|i| str += i.to_s + "\n"}
        return str
    end

    private :table, :table=

end