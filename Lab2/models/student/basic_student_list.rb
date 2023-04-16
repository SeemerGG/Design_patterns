require_relative 'student_list_strategy'
class BasicStudentList
    attr_accessor :data, :list_strategy
    attr_reader :file_path
    def initialize(file_path, list_strategy)
        self.data = []
        self.list_strategy = list_strategy
        if(File.exist?(file_path))
            @file_path = file_path
        else
            raise IOError, "Файл не найден!"
            end
    end

    def read_all
        data = list_strategy.read_all(file_path)
    end

    def write_all
        list_strategy.write_all(file_path, data)
    end

    def select(id)
        return data.select {|student| student.id == id}
    end

    def get_k_n_student_short_list(k:, n:, data_list:nil)
        mass = self.data[k*n ... k*n + n].map{|student| StudentShort.fromStudent(student)}
        if data_list.nil?
            return Data_list.new(mass)
        else
            return data_list.mass = mass
        end
    end

    def add_student(student)
        id = (self.data.map{|i| i.id}).max + 1
        data << student.id=id
    end

    #Находит номер элемента с нужным id и на его место ставит новый элемент.
    #Вопрос: Нужно ли менять id новому елементу на тот который был?
    def change(id, student)
        i = self.data.find_index{|i| i.id == id}
        self.data[i] = student
    end

    def sort
        self.data.sort_by{|i| i.fio}
    end

    def remove(id)
        i = self.data.find_index{|i| i.id == id}
        self.data.delete_at(i)
    end

    def get_student_short_count
        return self.data.size
    end
    
    private :data, :data=, :file_path

end