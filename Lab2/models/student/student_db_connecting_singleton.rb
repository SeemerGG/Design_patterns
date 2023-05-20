require 'mysql2'
class StudentDbConnectingSingleton
    private_class_method :new

    attr_reader :client
    def initialize
        @client = Mysql2::Client.new(
          :host => '127.0.0.1',
          :username => 'root',
          :password => 'vova0093',
          :database => 'student',
          :encoding => 'utf8'
        )
    end

    @instance = new

    def self.instance
        return @instance
    end


end