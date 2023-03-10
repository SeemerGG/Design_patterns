class Data_list

    def initialize(mass)
        self.mass = mass
    end
    def select(num)
        return self.mass[num]
    end
    def get_selected(start, end)
        return self.mass[start..end].map {|i| i.id}
    end
    def get_data()
        
    end 
    private 

    attr_accessor :mass
end