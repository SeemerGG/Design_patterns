class Student
    attr_reader :last_name, :first_name, :patronymic, :tel_num, :telegram, :mail, :git, :id
    
    def initialize(last_name:, first_name:, patronymic:, tel_num: nil, telegram: nil, mail: nil, git: nil, id: nil)

        @first_name, @last_name, @patronymic = first_name, last_name, patronymic
        set_contacts(telegram, mail, git, id, tel_num)

    end

    
    def to_s
        return "#{@last_name}\n#{@first_name}\n#{@patronymic}\n#{@tel_num!=nil ? @tel_num+"\n": "" }#{@telegram!=nil ? @telegram+"\n": ""}#{@mail!=nil ? @mail+"\n" : ""}#{@git!=nil ? @git+"\n": ""}#{@id!=nil ? @id+"\n": ""}"
    end
    
    def contact_and_git?()
        if(git != nil)
            if(telegram != nil)
                return true 
            end
            if(tel_num != nil)
                return true 
            end
            if(mail != nil)
                return true 
            end
        end
        return false 
    end 

    def set_contacts(telegram, mail, git, id, tel_num)
        @telegram = Student.telegram_correct?(telegram) ? telegram : nil
        @mail = Student.mail_correct?(mail) ? mail : nil
        @git = Student.git_correct?(git) ? git : nil
        @id = Student.id_correct?(id) ? id : nil
        @tel_num = Student.tel_num_correct?(tel_num) ? tel_num : nil
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

    def output_to_screen
        puts to_s
    end

    def first_name=(var)
        @first_name = var
    end

    def last_name=(var)
        @last_name
    end

    def patronymic=(var)
        @patronymic=var
    end

    def git=(var)
        @git=var
    end

    def mail=(var)
        @mail = var
    end

    def id=(var)
        @id=var
    end
end