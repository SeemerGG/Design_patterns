require 'mysql2'
class StudentDbConnecting
  class<<self
    attr_reader client

    @client = Mysql2::Client.new(
      :host => '127.0.0.1',
      :username => 'root',
      :password => '1234',
      :database => 'student',
      :encoding => 'utf8'
    )
    def get_client
      return self.client
    end

    def fill_student(data)

    end

    def get_student
      data = []
      self.client.query("select * from student").each do |result|
        data.push(Student.new(**result))
      end
      return data
    end

  end

end