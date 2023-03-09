require_relative 'Student'
class StudentShort
    attr_reader :id, :fio, :git, :contact

    def initialize(id:, str:)
        hash = JSON.parse(str, {symbolize_names: true})
        @id = id
        @fio = hash[fio:]
        @git = hash[git:]
        @contact = hash[contact:]
    end

    def self.fromStudent(studentObj)
        StudentShort.new(id:studentObj.id, str:studentObj.getInfo)
    
    # def initialize(id:, fio:, git:, contact:)
    #     @id = id
    #     @fio = fio
    #     @git = git
    #     @contact = contact        
    # end 

    # def self.fromStudent(studentObj)
    #     hash = JSON.parse(studentObj.getInfo, {symbolize_names: true})
    #     StudentShort.new(id:studentObj.id, **hash)
    # end

    # def self.fromStr(id, str)
    #     hash = JSON.parse(str, {symbolize_names: true})
    #     StudentShort.new(id:id, **hash)
    # end

    def to_s()
        return JSON.generate({:id => "#{@id}", :fio => "#{@fio}", :git => "#{@git}", :contact => "#{@contact}"})
    end

end