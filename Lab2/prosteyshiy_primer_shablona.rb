class A
    attr_accessor :field1

    def initialize(field1:)
        self.field1 = field1
    end

    def method
        return self.field1.map {|i| oper(i)}
    end

    def oper(i)
        return i**2
    end

    def to_s
        return self.field1.to_s
    end
end

class B < A 
    def oper(i)
        return i**3
    end
end

obj1 = A.new(field1:[1,2,3,4])
puts obj1.method

obj2 = B.new(field1:[1,2,3,4])
puts obj2.method