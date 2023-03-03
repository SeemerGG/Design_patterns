class Student
    
    def initialize(last_name:, first_name:, patronymic:, tel_num: nil, telegram: nil, mail: nil, git: nil, id: nil)

        @first_name, @last_name, @patronymic = first_name, last_name, patronymic

        @tel_num, @telegram, @mail, @git, @id = tel_num, telegram, mail, git, id

    end

    def get_first_name
        @first_name
    end

    def get_last_name
        @last_name
    end

    def get_patronymic
        @patronymic
    end

    def first_name=(var)
        @first_name = var
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

    def get_tel_num
        @tel_num
    end

    def tel_num=(var)
        @tel_num=var
    end

    def get_telegram(var)
        @telegram
    end

    def get_git
        @git
    end

    def git=(var)
        @git=var
    end

    def get_mail
        @mail
    end

    def mail=(var)
        @mail
    end

    def get_id
        @id
    end

    def id=(var)
        id=var
    end
end