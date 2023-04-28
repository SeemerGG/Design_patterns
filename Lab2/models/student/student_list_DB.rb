require 'mysql2'
class StudentListDB
  attr_accessor :client, :data

  def initialize
    students = []
    client.query("select * from student").each do |result|
      students.push(Student.new(**result))
    end
    self.data= students
  end
  def get_student_by_id(id)
    result = client.query("select * from student where id = #{id}")
    result.each do |row|
      return Student.new(**row)
    end
  end
  def get_k_n_student_short_list(k, n) # Не знаю как надо, делаю так
    mass = self.data[k*n ... k*n + n].map{|student| StudentShort.fromStudent(student)}
    return Data_list.new(mass)
  end
  def add_student(student)
    id = (self.data.map{|i| i.id}).max + 1
    student.id = id
    self.data << student
  end
  def change(id, student)
    i = self.data.find_index{|i| i.id == id}
    student.id = id
    self.data[i] = student
  end
  def remove(id)
    i = self.data.find_index{|i| i.id == id}
    self.data.delete_at(i)
  end

  def size
    return self.data.size
  end

end