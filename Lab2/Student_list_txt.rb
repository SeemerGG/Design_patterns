require_relative 'Student.rb'
require_relative 'Data_list.rb'
require_relative 'Data_list_student_short.rb'
class Student_list_txt
    attr_accessor :data
    attr_reader :file_path

    def initialize(file_path)
        self.data = []
        @file_path = file_path
    end

    def read_all()
        self.data = Student.read_from_txt(self.file_path)
    end

    def write_all()
        Student.write_to_txt(self.data)
    end

    
    def select(id)
        return data.select {|student| student.id == id}
    end

    
    def get_k_n_student_short_list(k:, n:, data_list:nil)
        mass = self.data[k*n ... k*n + n].map{|student| StudentShort.fromStudent(student)}
        if(data_list == nil)
            return Data_list.new(mass)
        else
            return data_list.mass = mass
        end
    end
     
    def add_student(student)
        id = (self.data.map{|i| i.id})
        data << student.id=id
    end

    def sort()
        self.data.sort_by{|i| i.fio}
    end

    def change(id, student)
        i = self.data.find_index{|i| i.id == id}
        self.data[i] = student
    end

    def remove(id)
        i = self.data.find_index{|i| i.id == id}
        self.data.delete_at(i)
    end

    def get_student_short_count()
        return self.data.size
    end
    
    private :data, :data=, :file_path
end