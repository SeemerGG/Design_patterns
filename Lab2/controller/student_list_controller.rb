require_relative '../models/data/data_list_student_short'
class StudentListController
  attr_accessor :view, :student_client, :current_page, :pages, :student_short_list

  def initialize(view)
    self.view = view
    self.student_short_list = Data_list_student_short.new
    self.student_short_list.add_sub(view)
    self.student_client = StudentListDB.new(StudentDbConnectingSingleton.instance.client)
    self.current_page = 1
    self.pages = student_client.size / 10 + 1
  end

  def refresh_data
    self.student_short_list = self.student_client.get_k_n_student_short_list(self.current_page, 10, self.student_short_list)
    self.student_short_list.notify
  end

  def next_page
    if self.current_page + 1 <= self.pages
      self.current_page += 1
      self.refresh_data
    end
  end

  def prev_page
    if self.current_page != 1
      self.current_page -= 1
      self.refresh_data
    end
  end

  def delete(sel_row_start, sel_row_end, table)
    (sel_row_start..sel_row_end).each do |idx|
      id = student_short_list.mass[(idx.to_i)-1].id
      self.student_client.remove(id)
    end
    self.refresh_data
    self.pages = self.student_short_list.mass.count / 10 + 1
    self.cur_page_refresh
  end

  def cur_page_refresh
    if self.current_page >= self.pages
      self.current_page = self.pages
    elsif self.current_page <= 1
      self.current_page = 1
    end
  end

  private :view=, :student_client=, :current_page=, :pages=, :student_short_list=

end