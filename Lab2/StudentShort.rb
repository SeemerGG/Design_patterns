require_relative 'Student'
require_relative 'BasicStudent'
require 'json'

class StudentShort < BasicStudent
    attr_reader :fio, :contact

    def initialize(id:, str:)
        hash = JSON.parse(str, {symbolize_names: true})
        @id = id
        @fio = hash[:fio]
        @git = hash[:git]
        @contact = hash[:contact]
    end

    def self.fromStudent(studentObj)
        StudentShort.new(id:studentObj.id, str:studentObj.getInfo)
    end

    def to_s()
        return JSON.generate({:id => "#{@id}", :fio => "#{@fio}", :git => "#{@git}", :contact => "#{@contact}"})
    end

end