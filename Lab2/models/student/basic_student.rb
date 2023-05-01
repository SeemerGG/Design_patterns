

class BasicStudent

    attr_reader :id, :git

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
        return var.is_a? Integer
     end
 
    def self.name_correct?(var)
        return /^[а-я, А-Я]+$/ === var
    end

    def self.fio_correct?(var)
        return /^[А-Яа-я]+\s+[А-Яа-я]\. [А-Яа-я]\.$/ === var
    end

    def self.contact_correct?(var)
        str = var.split()
        if(str[0] == 'telegram:')
            telegram_correct?(str[1])
        elsif(str[0] == 'tel_num:')
            tel_num_correct?(str[1])
        else
            mail_correct?(str[1])
        end
    end

end