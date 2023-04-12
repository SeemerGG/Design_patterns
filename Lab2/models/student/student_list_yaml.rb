require_relative 'student'
require_relative '../data/data_list'
require_relative '../data/data_list_student_short'
require_relative 'basic_student_list'

class StudentListYaml < BasicStudentList

  def read_all
    self.data = Student.read_from_yaml(file_path)
  end

  def write_all
    Student.write_to_yaml(file_path, data)
  end

end