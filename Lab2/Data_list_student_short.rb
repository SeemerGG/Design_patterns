require_relative 'Data_list.rb'
require_relative 'Data_table.rb'

class Data_list_student_short < Data_list

    def get_names()
        return ["fio", "git", "contact"]
    end

    private
    
    def values(obj)
        return [obj.fio, obj.git, obj.contact]
    end
end