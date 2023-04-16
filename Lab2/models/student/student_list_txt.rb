require_relative 'student'
require_relative '../data/data_list'
require_relative '../data/data_list_student_short'
require_relative 'basic_student_list'

class StudentListTxt < StudentListStrategy

    def read_all(file_path)
        return Student.read_from_txt(file_path)
    end

    def write_all(file_path, data)
        Student.write_to_txt(file_path, data)
    end

end