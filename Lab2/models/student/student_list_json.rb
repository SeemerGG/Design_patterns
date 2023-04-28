require_relative 'student'
require_relative '../data/data_list'
require_relative '../data/data_list_student_short'
require_relative 'basic_student_list'

class StudentListJson < StudentListStrategy
    
    def read_all(file_path)
        current_file_path = file_path + ".json"
        if(File.exist?(current_file_path))
            return Student.read_from_json(file_path + ".json")
        else
            raise IOError, "Файл #{current_file_path} не найден!"
        end
    end

    def write_all(file_path, data)
        Student.write_to_json(file_path + ".json" ,data)
    end

end