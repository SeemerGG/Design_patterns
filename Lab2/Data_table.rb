class Data_table

    def initialize(entiti)
        self.table = entiti
    end

    def self.value(i, j)
        return self.table[i][j]
    end

    def self.count_colum()
        return self.table.size()
    end

    def self.count_line()
        return self.table[0].size()
    end

    private

    attr_accessor :table

end