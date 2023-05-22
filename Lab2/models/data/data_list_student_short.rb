require_relative 'data_list'
require_relative 'data_table'

class Data_list_student_short < Data_list
    attr_accessor :subs

    def initialize(mass: [])
        super(mass)
        self.subs = []
    end

    def add_sub(sub)
        self.subs << sub
    end

    def delete_sub(sub)
        self.subs.delete(sub)
    end

    def notify
        self.subs.each { |sub|
            sub.set_table_params(self.get_names, self.mass.count)
            sub.set_table_data(self.get_data)
        }
    end

    def get_names
        %w[№ ФИО Гит Контакт]
    end

    protected
    def values(obj)
        [obj.fio, obj.git, obj.contact]
    end
end