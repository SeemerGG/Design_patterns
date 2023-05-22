require_relative 'models/student/student'
require_relative 'models/student/student_short'
require_relative 'models/data/data_list_student_short'
require_relative 'models/data/data_list'
require_relative 'models/data/data_list'
require_relative 'models/data/data_table'
require_relative 'models/student/student_list_txt'
require_relative 'models/student/student_list_json'
require_relative 'models/student/student_list_yaml'
require_relative 'models/student/student_list_DB'
require_relative 'models/student/student_db_connecting_singleton'
require_relative 'GUI/student_list_view'
require_relative 'controller/student_list_controller'
require 'fox16'
include Fox
# student1 = Student.new(last_name:"Курбатский", first_name:"Владимир", patronymic:"Александрович")
# student2 = Student.new(last_name:"Чутчев", first_name:"Сергей", patronymic:"Сергеевич", tel_num:"88008553535")
# student3 = Student.fromStr('{"last_name":"Якухнов", "first_name":"Роман", "patronymic":"Андреевич", "git":"https://github.com/RedMag", "id":2345, "telegram":"https://t.me/RedMag", "mail":"ssdfgdf@gmail.com"}')
#
# puts student1
# puts student2
# puts student3
# puts ''
# student1.mail="ddhm015@gmail.com"
#
# puts student1
# puts ''
# puts student3.getInfo
# puts student2.getInfo
# puts student1.getInfo
#
# studentShort1 = StudentShort.fromStudent(student3)
#
# studentShort2 = StudentShort.fromStr(id:1234,str:student3.getInfo)
# puts ''
# puts studentShort1
# puts studentShort2
#
# students = Student.read_from_txt('resources/data_about_student.txt')
# puts ''
# students.map{|student| puts student.getInfo}
#
# Student.write_to_txt('resources/data_about_student_from_write_to_txt.txt', students)
# puts ''
# students2 = Student.read_from_txt('resources/data_about_student_from_write_to_txt.txt')
#
# students2.map{|student| puts student.getInfo}
#
# puts ''
# #Проверка реализации data_table data_list data_list_student_short
# var = Data_list_student_short.new([studentShort1, studentShort2])
# puts var
# puts var.get_data
#
# puts "____________________________________________________________________"
#
#
# #student_from_json = Student.read_from_json('resources/data_about_student.json')
# student_from_json = Student.read_from_json('resources/proverka_json.json')
# puts student_from_json
#
# #puts student_from_json
#
# Student.write_to_yaml('resources/data_generation_yaml.yaml', student_from_json)
#
# students_from_yaml = Student.read_from_yaml('resources/data_generation_yaml.yaml')
#
# puts students_from_yaml.class
# puts students_from_yaml.first.class
# puts students_from_yaml
#
# puts "Проверка стратегии"
# basic_list = BasicStudentList.new('resources/data_about_student_strategy', StudentListJson.new)
#
# basic_list.read_all
# basic_list.list_strategy = StudentListTxt.new
# basic_list.write_all
# basic_list.list_strategy = StudentListYaml.new
# basic_list.write_all
#
# puts "----------------------------------------------------------------------"
#
# db = StudentListDB.new(StudentDbConnectingSingleton.instance.client)
#
# puts db.size
#
#
#
app = FXApp.new
StudentListView.new(app)
app.create
app.run
# student_list_db = StudentListDB.new(StudentDbConnectingSingleton.instance.client)
# student_list_db.change(1, student_list_db.get_student_by_id(5))
# student_short = student_list_db.get_k_n_student_short_list(1, 5).get_data
# puts student_short
