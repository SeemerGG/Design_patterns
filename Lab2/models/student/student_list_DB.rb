require 'mysql2'
require_relative 'student'
require_relative '../data/data_list_student_short'
class StudentListDB

  attr_reader :client
  def initialize(client)
    @client = client
  end

  def get_student_by_id(id)
    result = client.query("select * from student where id = #{id}", :symbolize_keys => true)
    result.each do |row|
      return Student.new(**row)
    end
  end
  def get_k_n_student_short_list(k, n, data_list = nil ) # Не знаю как надо, делаю так
    mass = []
    result = client.query("select * from student limit #{(k-1)*n}, #{n}", :symbolize_keys => true)
    result.each do |hash|
      mass << StudentShort.fromStudent(Student.new(**hash))
    end
    if data_list.nil?
      Data_list_student_short.new(mass:mass)
    else
      data_list.mass =  mass
      data_list
    end
  end

  def add_student(student)
    self.client.query("insert into student(last_name, first_name, patronymic, tel_num, telegram, mail, git) values " +
                   "('#{student.last_name}', '#{student.first_name}', '#{student.patronymic}', '#{student.tel_num}', '#{student.telegram}', '#{student.mail}', '#{student.git}')")
  end
  def change(id, student)
    self.client.query("update student set last_name = '#{student.last_name}', first_name = '#{student.first_name}', " +
                   "patronymic = '#{student.patronymic}', tel_num = '#{student.tel_num}', telegram = '#{student.telegram}', mail = '#{student.mail}', git = '#{student.git}' where id = #{id}")
  end
  def remove(id)
    self.client.query("delete from student where id = #{id}")
  end

  def size
    print client
    self.client.query("select COUNT(*) as count from student", :symbolize_keys => true).take(1)[0][:count]
  end

end