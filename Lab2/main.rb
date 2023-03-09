require_relative 'Student'
require_relative 'StudentShort'

student1 = Student.new(last_name:"Курбатский", first_name:"Владимир", patronymic:"Александрович")
student2 = Student.new(last_name:"Чутчев", first_name:"Сергей", patronymic:"Сергеевич", tel_num:"88008553535")
student3 = Student.fromStr('{"last_name":"Якухнов", "first_name":"Роман", "patronymic":"Андреевич", "git":"https://github.com/RedMag", "id":"2345", "telegram":"https://t.me/RedMag", "mail":"ssdfgdf@gmail.com"}')

puts student1
puts student2
puts student3

student1.mail="ddhm015@gmail.com"

puts student1

puts student3.getInfo

puts student2.getInfo

puts student1.getInfo

studentShort1 = StudentShort.fromStudent(student3)

studentShort2 = StudentShort.fromStr("1234",student3.getInfo)

puts studentShort1

puts studentShort2

