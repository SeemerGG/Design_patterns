require_relative 'Student'

student1 = Student.new(last_name:"Курбатский", first_name:"Владимир", patronymic:"Александрович")
student2 = Student.new(last_name:"Чутчев", first_name:"Сергей", patronymic:"Сергеевич", tel_num:"88005553535")
student3 = Student.new(last_name:"Якухнов", first_name:"Роман", patronymic:"Андреевич", git:"https://github.com/RedMag", id:"2345", telegram:"https://t.me/RedMag", mail:"ssdfgdf@gmail.com")

#student1.output_to_screen
#student2.output_to_screen
#student3.output_to_screen

student1.mail= "ddhm015@gmail.com"


student3.output_to_screen