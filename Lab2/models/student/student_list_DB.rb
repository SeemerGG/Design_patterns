require 'mysql2'
require_relative 'student'
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
  def get_k_n_student_short_list(k, n, data_list:nil ) # Не знаю как надо, делаю так
    mass = []
    result = client.query("select * from student where id >= #{k*n} and id <= #{k*n + n}", :symbolize_keys => true)
    result.each do |hash|
      mass << StudentShort.fromStudent(Student.new(**hash))
    end
    if data_list.nil?
      return Data_list.new(mass)
    else
      return data_list.mass = mass
    end
  end
  def add_student(student)
    client.query("insert into student(last_name, first_name, patronymic, tel_num, telegram, mail, git) values " +
                   "('#{student.last_name}', '#{student.first_name}', '#{student.patronymic}', '#{student.tel_num}', '#{student.telegram}', '#{student.mail}', '#{student.git}')")
  end
  def change(id, student)
    client.query("update student set last_name = '#{student.last_name}', first_name = '#{student.first_name}', " +
                   "patronymic = '#{student.patronymic}', tel_num = '#{student.tel_num}', telegram = '#{student.telegram}', mail = '#{student.mail}', git = '#{student.mail}' where id = #{id}")
  end
  def remove(id)
    client.query("delete from student where id = #{id}")
  end

  def size
    return client.query("select COUNT(*) as count from student", :symbolize_keys => true).take(1)[0][:count]
  end

end