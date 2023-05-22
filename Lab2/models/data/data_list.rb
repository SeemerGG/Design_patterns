class Data_list

    attr_accessor :mass, :selected

    def initialize(mass)
        self.mass = Array.new(mass)
        self.selected = Array.new
    end

    def select(num)
        self.selected << self.mass[num]
    end

    def get_selected
        self.selected.map {|i| i.id}
    end

    def get_names
    end
    
    #Возвращает объект класса Data_table
    def get_data
        data = []
        count = 0
        self.mass.each do |obj|
            row = []
            row << count
            row += values(*obj)
            data << row
            count += 1
        end
        Data_table.new(data)
    end

    def to_s
        str = ""
        self.mass.each {|i| str += i.to_s + "\n"}
        str
    end 

    private :selected=, :selected
    #Возвращает массив значений каждого поля
    def values(obj)
        []
    end

end