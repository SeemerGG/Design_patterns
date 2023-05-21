require_relative '../models/data/data_list_student_short'
class StudentListController
  attr_accessor :view, :student_client, :current_page, :pages, :student_short_list

  def initialize(view)
    self.view = view
    self.student_short_list = Data_list_student_short.new(view)
    self.student_client = StudentListDB.new(StudentDbConnectingSingleton.new)
    self.current_page = 1
    self.pages = student_client.size.div(10)+1
  end

  def refresh_data
    self.student_client.get_k_n_student_short_list(self.current_page, 10, student_short_list)
  end

end