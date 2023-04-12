require_relative 'student'
require_relative 'basic_student'
require 'json'

class StudentShort < BasicStudent
    attr_reader :fio, :contact

    def initialize(id:, fio:, git:, contact:)
        @id = id
        @fio = fio
        @git = git
        @contact = contact
    end

    private_class_method :new

    def self.fromStr(id:, str:)
        hash = JSON.parse(str, {symbolize_names: true})
        if(StudentShort.parseStr(hash: hash))
            new(id:id, **hash) 
        end
    end

    def self.parseStr(hash:)
        if(hash.keys == [:fio, :git, :contact])
            if(fio_correct?(hash[:fio]) && git_correct?(hash[:git]) && contact_correct?(hash[:contact]))
                return true
            else
                raise ArgumentError, "Параметры не удовлетворяют шаблону!"
            end
        else
            raise ArgumentError, "Строка неправильного формата!"
        end
    end
            
    def self.fromStudent(studentObj)
        StudentShort.fromStr(id: studentObj.id, str:studentObj.getInfo)
    end

    def to_s
        return JSON.generate({:id => "#{@id}", :fio => "#{@fio}", :git => "#{@git}", :contact => "#{@contact}"})
    end

end