require_relative 'Student'
require_relative 'StudentShort'
require_relative 'Data_list_student_short.rb'
require_relative 'Data_list.rb'
require_relative 'Data_list.rb'
require_relative 'Student_list_txt.rb'

student1 = Student.new(last_name:"Курбатский", first_name:"Владимир", patronymic:"Александрович")
student2 = Student.new(last_name:"Чутчев", first_name:"Сергей", patronymic:"Сергеевич", tel_num:"88008553535")
student3 = Student.fromStr('{"last_name":"Якухнов", "first_name":"Роман", "patronymic":"Андреевич", "git":"https://github.com/RedMag", "id":"2345", "telegram":"https://t.me/RedMag", "mail":"ssdfgdf@gmail.com"}')

puts student1
puts student2
puts student3
puts ''
student1.mail="ddhm015@gmail.com"

puts student1
puts ''
puts student3.getInfo
puts student2.getInfo
puts student1.getInfo

studentShort1 = StudentShort.fromStudent(student3)

studentShort2 = StudentShort.fromStr(id:"1234",str:student3.getInfo)
puts ''
puts studentShort1
puts studentShort2

students = Student.read_from_txt('data_about_student.txt')
puts ''
students.map{|student| puts student.getInfo}

Student.write_to_txt('data_about_student_from_write_to_txt.txt', students)
puts ''
students2 = Student.read_from_txt('data_about_student_from_write_to_txt.txt')

students2.map{|student| puts student.getInfo}

puts ''
#Проверка реализации data_table data_list data_list_student_short
var = Data_list_student_short.new([studentShort1, studentShort2])
puts var
puts var.get_data

puts "____________________________________________________________________"

list_txt = Student_list_txt.new('data_about_student.txt')
list_txt.read_all()
puts list_txt.get_k_n_student_short_list(k:0,n:2)

puts '+++++++++++++++++++++++++++++++'

student_from_json = Student.read_from_json('data_about_student.json')
#puts student_from_json

Student.write_to_txt('data_generated_from_json.json',student_from_json)
puts '==================================================='
students_from_yaml = Student.read_from_yaml('data_generation_yaml.yaml')
students_from_yaml.map{|i| puts i}



