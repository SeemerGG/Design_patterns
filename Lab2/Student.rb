require 'json'
require 'racc/exception'
require 'set'
class Student
    attr_reader :last_name, :first_name, :patronymic, :tel_num, :telegram, :mail, :git, :id
    
    def initialize(last_name:, first_name:, patronymic:, tel_num: nil, telegram: nil, mail: nil, git: nil, id: nil)

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
        #begin
        #hash = JSON.parse(str, {symbolize_names: true})
        #Student.new(**hash)
        #rescue ArgumentError => e 
        #    puts e.message
        #end
    end


    def getFio()
        return {:fio => "#{@last_name} #{first_name[0]}. #{patronymic[0]}."}
    end 

    def getContact()
        # if(@telegram != nil)
        #     return '{"contact": "telegram: #{@telegram}"}'
        # elsif(@mail != nil)
        #     return '{"contact": "mail: #{@mail}"}'
        # elsif(@tel_num != nil)
        #     return '{"contact": "tel_num: #{@tel_num}"}'
        # else 
        #     return '{"contact": nil}'
        # end
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
        return "#{@last_name}\n#{@first_name}\n#{@patronymic}\n#{@tel_num!=nil ? @tel_num+"\n": "" }#{@telegram!=nil ? @telegram+"\n": ""}#{@mail!=nil ? @mail+"\n" : ""}#{@git!=nil ? @git+"\n": ""}#{@id!=nil ? @id+"\n": ""}"
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

    def self.tel_num_correct?(var)
       return /^\+?\d{11,13}/ === var 
    end

    def self.telegram_correct?(var)
        return /^https:\/\/t.me\/*/ === var
    end 

    def self.mail_correct?(var)
        return /^[A-Z0-9._%+-]+@[A-Z0-9-]+.+.[A-Z]{2,4}$/i === var
    end

    def self.git_correct?(var)
        return /^https:\/\/*.*\/*/ === var
    end

    def self.id_correct?(var)
        return /^[0-9]+$/ === var
    end

    def first_name=(var)
        @first_name = var
    end

    def last_name=(var)
        @last_name=var
    end

    def patronymic=(var)
        @patronymic=var
    end

    def git=(var)
        if(var == nil)
            @git = var
        else
            Student.git_correct?(var) ? @git = var : (raise 'Ссылка на git не удовлетворяет шаблону!')
        end
    end

    def mail=(var)
        if(var == nil)
            @mail = var
        else
            Student.mail_correct?(var) ? @mail = var :  (raise 'Ссылка на почту не удовлетворяет шаблону!')
        end
    end

    def id=(var)
        if(var == nil)
            @id = var
        else
            Student.id_correct?(var) ? @id = var : (raise 'Идентификационный номер не удовлетворяет шаблону!')
        end
    end

    def tel_num=(var)
        if(var == nil)
            @tel_num = var
        else
            Student.tel_num_correct?(var) ? @tel_num = var : (raise 'Номер не удовлетворяет шаблону!')
        end
    end

    def telegram=(var)
        if(var == nil)
            @telegram = var
        else
            Student.telegram_correct?(var) ? @telegram = var : (raise 'ССылка на телеграм не удовлетворяет шаблону!')
        end
    end

end