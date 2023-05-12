require 'fox16'
include Fox

class StudentMainWindow < FXMainWindow
  private
  attr_writer :add_button, :change_button, :del_button, :upd_button
  attr_writer :prev_button, :next_button
  attr_writer :page_count_label, :cur_page_label
  attr_writer :table, :tab_book

  public
  attr_reader :add_button, :change_button, :del_button, :upd_button
  attr_reader :prev_button, :next_button
  attr_reader :page_count_label, :cur_page_label
  attr_reader :table, :tab_book

  def handle_list_box_command index, listbox, field
    item_text = listbox.getItemText(index)
    if(item_text == "Да")
      field.enable
    else
      field.disable
    end
  end

  def add_listboxed_field frame, presence_of, field_name, field_width
    label = FXLabel.new(frame, presence_of)
    list = FXListBox.new(frame, width: 10, opts: COMBOBOX_STATIC | COMBOBOX_NO_REPLACE)
    list.appendItem("Да")
    list.appendItem("Нет")
    list.appendItem("Не важно")

    field_label = FXLabel.new(frame, field_name, :y => 90)
    field = FXTextField.new(frame, field_width)

    list.connect(SEL_COMMAND) do |_, _, index|
      handle_list_box_command index, list, field
    end
  end

  def add_name_field frame
    name_label = FXLabel.new(frame, "Фамилия и инициалы: ")
    name_field = FXTextField.new(frame, 90)
  end

  def add_git_field frame
    add_listboxed_field frame, "Наличие гита:               ", "Гит:            ", 66
  end

  def add_email_field frame
    add_listboxed_field frame, "Наличие Email:             ", "Email:         ", 66
  end

  def add_phone_field frame
    add_listboxed_field frame, "Наличие телефона:     ", "Телефон:   ", 66
  end

  def add_tg_field frame
    add_listboxed_field frame, "Наличие телеграма:    ", "Телеграм: ", 66
  end

  def add_table frame
    self.table = FXTable.new(frame, :opts => LAYOUT_FILL)
    self.table.editable = false
  end

  def add_crud_buttons frame
    self.add_button = FXButton.new(frame, "Добавить")
    self.change_button = FXButton.new(frame, "Изменить")
    self.del_button = FXButton.new(frame, "Удалить")
    self.upd_button = FXButton.new(frame, "Обновить")

    self.change_button.disable
    self.del_button.disable
  end

  def add_lcr_buttons frame
    self.prev_button = FXButton.new(frame, "<<")

    self.cur_page_label = FXLabel.new(frame, "")

    FXLabel.new(frame, "/")

    self.page_count_label = FXLabel.new(frame, "")

    self.next_button = FXButton.new(frame, ">>")
  end

  def set_table_headers arr
    self.table.setColumnText(0, "№")

    arr.each_with_index { |value, index|
      self.table.setColumnText(index+1, value)
    }
  end

  def initialize(app)
    super(app, "StudentListView" , :width => 720, :height => 600)

    self.tab_book = FXTabBook.new(self)
    tabFrame1 = FXTabItem.new(self.tab_book, "Вкладка 1", nil)
    vFrame1 = FXVerticalFrame.new(self.tab_book)

    tabFrame2 = FXTabItem.new(self.tab_book, "Вкладка 2", nil)
    vFrame2 = FXVerticalFrame.new(self.tab_book)

    tabFrame3 = FXTabItem.new(self.tab_book, "Вкладка 3", nil)
    vFrame3 = FXVerticalFrame.new(self.tab_book)

    hFrame1 = FXHorizontalFrame.new(self)
    self.add_name_field hFrame1
    hFrame9 = FXHorizontalFrame.new(self)
    self.add_git_field hFrame9
    hFrame2 = FXHorizontalFrame.new(self)
    self.add_email_field hFrame2
    hFrame3 = FXHorizontalFrame.new(self)
    self.add_phone_field hFrame3
    hFrame4 = FXHorizontalFrame.new(self)
    self.add_tg_field hFrame4
    hFrame5 = FXHorizontalFrame.new(self)
    FXLabel.new(hFrame5, "Таблица")
    hFrame6 = FXHorizontalFrame.new(self, opts: LAYOUT_FILL_X | LAYOUT_FIX_HEIGHT)
    hFrame6.height = 230
    self.add_table hFrame6
    hFrame7 = FXHorizontalFrame.new(self, opts: LAYOUT_FILL_X)
    add_lcr_buttons hFrame7
    hFrame8 = FXHorizontalFrame.new(self, opts: LAYOUT_FILL_X)
    add_crud_buttons hFrame8

  end

  def create
    super
    show(PLACEMENT_SCREEN)
  end
end