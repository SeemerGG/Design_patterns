require_relative 'Student'
require_relative 'StudentShort'

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

studentShort2 = StudentShort.new(id:"1234",str:student3.getInfo)
puts ''
puts studentShort1
puts studentShort2

students = Student.read_from_txt('C:\Users\Dikiy\OneDrive\Документы\GitHub\Design_patterns\Lab2\data_about_student.txt')
puts ''
students.map{|student| puts student.getInfo}

Student.write_to_txt('C:\Users\Dikiy\OneDrive\Документы\GitHub\Design_patterns\Lab2\data_about_student_from_write_to_txt.txt', students)
puts ''
students2 = Student.read_from_txt('C:\Users\Dikiy\OneDrive\Документы\GitHub\Design_patterns\Lab2\data_about_student_from_write_to_txt.txt')

students2.map{|student| puts student.getInfo}