require_relative 'data_list'
require_relative 'data_table'

class Data_list_student_short < Data_list
    attr_accessor :view

    def initialize(view)
        super([])
        self.view = view
    end

    def notify
        self.view.set_table_params(get_names, self.mass.count)
        self.view.set_table_data(self)
    end

    def get_names
        return ["№", "ФИО", "Гит", "Контакт"]
    end

    def values(obj)
        return [obj.fio, obj.git, obj.contact]
    end
end