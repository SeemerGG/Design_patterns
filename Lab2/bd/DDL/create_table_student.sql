use student;

create table if not exists student (
id int primary key not null auto_increment,
last_name varchar(45), 
first_name varchar(45), 
patronymic varchar(45), 
tel_num varchar(45),
telegram varchar(45), 
mail varchar(45),
git varchar(45)
);
