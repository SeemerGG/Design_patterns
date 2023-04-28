require 'json'
require 'racc/exception'
require 'set'
require 'yaml'
require_relative 'basic_student'

class Student < BasicStudent
    attr_reader :last_name, :first_name, :patronymic, :tel_num, :telegram, :mail
    
    def initialize(last_name:, first_name:, patronymic:, tel_num: nil, telegram: nil, mail: nil, id:nil, git:nil)

        self.first_name = first_name
        self.last_name = last_name
        self.patronymic = patronymic
        self.id = id
        self.git = git
        set_contacts(telegram:telegram, mail:mail, tel_num:tel_num)
    end
    
    def self.fromStr(str)
        hash = JSON.parse(str, {symbolize_names: true})
        hashSet = hash.keys.to_set
        nameSet = Set.new([:first_name, :last_name, :patronymic, :git, :mail, :id, :telegram, :tel_num])
        if(nameSet.superset?(hashSet))
            Student.new(**hash)
        else
            raise ArgumentError, "Неверное именнование атрибутов!"
        end
    end
    
    def self.read_from_txt(filepath)
        begin
            students = []
            File.readlines(filepath).each do |line|
                students.push(self.fromStr(line))
            end
            return students
        rescue => exception
            puts exception.message
        end
    end

    def self.read_from_json(filepath)
        begin
            students = []
            data_from_file = File.read(filepath)
            hash = JSON.parse(data_from_file, {symbolize_names: true})
            hash.each do |student|
                students.push(Student.new(**student))
            end
            return students
        rescue => exception
            puts exception.message
        end
    end

    def self.write_to_json(filepath, students)
        begin
            hash_students = students.map {|student| student.to_h}
            File.open(filepath, "w").puts JSON.pretty_generate(hash_students) #CЮда смотрим
        rescue => exception
            puts exception.message
        end
    end

    def self.read_from_yaml(filepath)
        begin
            YAML.safe_load_file(filepath, permitted_classes: [Student, Symbol])
        rescue => exception
            puts exception.message
        end
    end


    def self.write_to_yaml(filepath, students)
        begin
        file = File.open(filepath, "w")
        file.puts students.to_yaml
        file.close
        rescue => exception
            puts exception.message
        end
    end

    def self.write_to_txt(filepath, students)
        begin
            file = File.open(filepath, "w")
            students.each do |student|
                file.puts student
            end
            file.close
        rescue => exception
            puts exception.message
        end
    end

    def getFio
        return {:fio => "#{@last_name} #{first_name[0]}. #{patronymic[0]}."}
    end 

    def getContact()
        if(@telegram != nil)
            return {:contact => "telegram: #{@telegram}"}
        elsif(@tel_num != nil)
            return {:contact => "tel_num: #{@tel_num}"}
        elsif(@mail != nil)
            return {:contact => "mail: #{@mail}"} 
        else
            return {:contact => nil}
        end
    end 

    def getInfo()
        return JSON.generate({}.merge(getFio()).merge({:git => @git!=nil ? "#{@git}" : nil}).merge(getContact()))
    end

    def set_contacts(telegram:nil, mail:nil ,tel_num:nil)
        self.tel_num = tel_num
        self.mail = mail
        self.telegram = telegram
    end

    def to_s
        return JSON.generate({:last_name => "#{@last_name}", :first_name => "#{@first_name}", :patronymic => "#{@patronymic}",:git => @git != nil ? "#{@git}" : nil, :id => @id != nil ? "#{@id}" : nil, :telegram => @telegram != nil ? "#{@telegram}" : nil, :tel_num => @tel_num != nil ? "#{@tel_num}" : nil, :mail => @mail != nil ? "#{@mail}" : nil})
    end

    def to_h
        return {:last_name => "#{@last_name}", :first_name => "#{@first_name}", :patronymic => "#{@patronymic}",:git => @git != nil ? "#{@git}" : nil, :id => @id != nil ? "#{@id}" : nil, :telegram => @telegram != nil ? "#{@telegram}" : nil, :tel_num => @tel_num != nil ? "#{@tel_num}" : nil, :mail => @mail != nil ? "#{@mail}" : nil}
    end

    def contact_and_git?()
        if(@git != nil)
            if(@telegram != nil)
                return true 
            end
            if(@tel_num != nil)
                return true 
            end
            if(@mail != nil)
                return true 
            end
        end
        return false 
    end 

    def first_name=(var)
        BasicStudent.name_correct?(var) ? @first_name = var : (raise ArgumentError,'Неправильное имя!')
    end

    def last_name=(var)
        BasicStudent.name_correct?(var) ? @last_name = var : (raise ArgumentError,'Неправильная фамилия!')
    end

    def patronymic=(var)
        BasicStudent.name_correct?(var) ? @patronymic = var : (raise ArgumentError,'Неправильное отчество!')
    end

    def mail=(var)
        if(var == nil)
            @mail = var
        else
            BasicStudent.mail_correct?(var) ? @mail = var :  (raise ArgumentError, 'Ссылка на почту не удовлетворяет шаблону!')
        end
    end

    def id=(var)
        if(var == nil)
            @id = var
        else
            BasicStudent.id_correct?(var) ? @id = var : (raise ArgumentError, 'Идентификационный номер не удовлетворяет шаблону!')
        end
    end

    def git=(var)
        if(var == nil)
            @git = var
        else
            BasicStudent.git_correct?(var) ? @git = var : (raise ArgumentError,'Ссылка на git не удовлетворяет шаблону!')
        end
    end

    def tel_num=(var)
        if(var == nil)
            @tel_num = var
        else
            BasicStudent.tel_num_correct?(var) ? @tel_num = var : (raise ArgumentError, 'Номер не удовлетворяет шаблону!')
        end
    end

    def telegram=(var)
        if(var == nil)
            @telegram = var
        else
            BasicStudent.telegram_correct?(var) ? @telegram = var : (raise ArgumentError, 'ССылка на телеграм не удовлетворяет шаблону!')
        end
    end

end