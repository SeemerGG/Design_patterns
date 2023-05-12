require_relative "student_main_window"
require 'fox16'
include Fox

class StudentListView
  attr_accessor :window
  def initialize
    app = FXApp.new

    self.window = StudentMainWindow.new(app)

    app.create
    app.run
  end

end