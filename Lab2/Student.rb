class Student
    attr_reader :last_name, :first_name, :patronymic, :tel_num, :telegram, :mail, :git, :id
    
    def initialize(last_name:, first_name:, patronymic:, tel_num: nil, telegram: nil, mail: nil, git: nil, id: nil)

        @first_name, @last_name, @patronymic = first_name, last_name, patronymic

        @tel_num, @telegram, @mail, @git, @id = tel_num, telegram, mail, git, id

    end

    def to_s
        return "#{@last_name}\n#{@first_name}\n#{@patronymic}\n#{@tel_num!=nil ? @tel_num+"\n": "" }#{@telegram!=nil ? @telegram+"\n": ""}#{@mail!=nil ? @mail+"\n" : ""}#{@git!=nil ? @git+"\n": ""}#{@id!=nil ? @git+"\n": ""}"
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