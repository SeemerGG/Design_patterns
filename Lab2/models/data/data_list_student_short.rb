require_relative 'data_list'
require_relative 'data_table'

class Data_list_student_short < Data_list

    def get_names()
        return ["№", "ФИО", "Гит", "Контакт"]
    end

    private
    
    def values(obj)
        return [obj.fio, obj.git, obj.contact]
    end
end