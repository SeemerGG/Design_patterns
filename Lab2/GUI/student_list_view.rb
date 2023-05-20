require 'fox16'
include Fox


class StudentListView < FXMainWindow

  attr_accessor :table

    def create_label(parent,text,x,y)
      FXLabel.new(parent, text , :opts => LAYOUT_EXPLICIT,
        :x => x, :y => y,
        :width => 50, :height => 20)
    end
    
    def create_text(parent,x,y)
      FXText.new(parent,:opts => LAYOUT_EXPLICIT,
        :x => x, :y => y,
        :width => 200, :height => 20)
    end

    def create_combobox(parent,x,y)
      FXComboBox.new(parent,40,:opts => LISTBOX_NORMAL|LAYOUT_EXPLICIT, :x => x, :y => y,
        :width => 200, :height => 20)
    end

    def create_button(parent,text,x,y)
      FXButton.new(parent,text,:opts => LAYOUT_EXPLICIT|BUTTON_NORMAL,:x=>x,:y=>y,
        :width=>40,:height=>25)
    end

    def sort_columns(table)
      initials =[]
      (0..(table.numRows-1)).each do |row|
        initials << [table.getItemText(row,1), table.getItemText(row, 2), table.getItemText(row, 3)]
      end
      initials.to_a
      initials = initials.sort_by{|a| a[0]}
      (0..initials.size-1).each do |i|
        table.setItemText(i,1,initials[i][0])
        table.setItemText(i,2,initials[i][1])
        table.setItemText(i,3,initials[i][2])
      end
    end

    def sort_at_fio(table)
      table.each_row
    end
    def initialize(app)
      super(app, "Hello, World!", :width => 1060, :height => 400)
      
      tabbook = FXTabBook.new(self, :opts => LAYOUT_FILL) 
      student_tab = FXTabItem.new(tabbook, " Студенты ")
      student_page = FXVerticalFrame.new(tabbook,:opts => FRAME_RAISED|LAYOUT_FILL)
      frame = FXVerticalFrame.new(student_page, :opts => LAYOUT_LEFT)
      

      create_label(frame, "ФИО", 0,0)
      fio_text = create_text(frame,0,20)
      
      state_names = ['Нет','Да','Неважно'] 
      
      
      create_label(frame,"Email",210,0)
      email_combobox = create_combobox(frame,210,20) 
      state_names.each { |name| email_combobox.appendItem(name)}
      email_text = create_text(frame,210,50)
      email_text.editable = false
      check_combobox(email_combobox,email_text)

      create_label(frame,"Git",420,0)
      git_combobox = create_combobox(frame,420,20)
      state_names.each { |name| git_combobox.appendItem(name)}
      git_text = create_text(frame,420,50)
      git_text.editable = false
      check_combobox(git_combobox,git_text)

      create_label(frame,"Телефон",630,0)
      phone_combobox = create_combobox(frame,630,20)
      state_names.each { |name| phone_combobox.appendItem(name)}
      phone_text = create_text(frame,630,50)
      phone_text.editable = false
      check_combobox(phone_combobox,phone_text)

      create_label(frame,"Телеграм",840,0)
      teleg_combobox = create_combobox(frame,840,20)
      state_names.each { |name| teleg_combobox.appendItem(name)}
      teleg_text = create_text(frame,840,50)
      teleg_text.editable = false
      check_combobox(teleg_combobox,teleg_text)
      
      self.table = FXTable.new(frame,:opts =>LAYOUT_EXPLICIT,:x=>0,:y=>80,:height=>221,:width=>1040)
      self.table.setTableSize(10,4)
      self.table.tableStyle |=TABLE_ROW_SIZABLE|TABLE_COL_SIZABLE 
      self.table.setColumnText(0, "№")
      self.table.setColumnText(1, "ФИО")
      self.table.setColumnText(2, "Git")
      self.table.setColumnText(3, "Contact")


      self.table.columnHeader.connect(SEL_COMMAND) do |_, _, index|
        if index == 1
          sort_columns(table)
        end
      end

      self.table.editable = false

      btn_back=FXButton.new(frame, "<<", :opts=> BUTTON_NORMAL|LAYOUT_EXPLICIT, :x=>0,:y=>310,:height=>30,:width=>40)
      label_page = FXLabel.new(frame,"1",:opts=> BUTTON_INITIAL|LAYOUT_EXPLICIT,:x=>40,:y=>310,:height=>30,:width=>20)
      btn_next=FXButton.new(frame, ">>", :opts=> BUTTON_NORMAL|LAYOUT_EXPLICIT, :x=>60,:y=>310,:height=>30,:width=>40)

      create_button = FXButton.new(frame,"Добавить",:opts => LAYOUT_EXPLICIT|BUTTON_NORMAL,:x=>110,:y=>310,
        :width=>80,:height=>30)

      update_button = FXButton.new(frame,"Обновить",:opts => LAYOUT_EXPLICIT|BUTTON_NORMAL,:x=>200,:y=>310,
        :width=>80,:height=>30)
      
      delete_button = FXButton.new(frame,"Удалить",:opts => LAYOUT_EXPLICIT|BUTTON_NORMAL,:x=>290,:y=>310,
        :width=>80,:height=>30)
      delete_button.enabled = false
      
      edit_button = FXButton.new(frame,"Изменить",:opts => LAYOUT_EXPLICIT|BUTTON_NORMAL,:x=>380,:y=>310,
        :width=>80,:height=>30)
      edit_button.enabled = false

      self.table.connect(SEL_COMMAND) do
          if get_select_rows() == 0 then 
            edit_button.enabled = true
            delete_button.enabled = true
          end

          if get_select_rows() > 0 then
            delete_button.enabled = true
            edit_button.enabled = false
          end

          if get_select_rows() < 0 then 
            delete_button.enabled = false
            edit_button.enabled = false
          end
      end  

      contact_tab = FXTabItem.new(tabbook, " Tab1 ")
      contact_page = FXVerticalFrame.new(tabbook,:opts => FRAME_RAISED|LAYOUT_FILL)
      extras_tab = FXTabItem.new(tabbook, " Tab2 ")
      extras_page = FXVerticalFrame.new(tabbook,:opts => FRAME_RAISED|LAYOUT_FILL)

      #Заполняем таблицу жоско
      for i in (0..9)
        table.setItemText(i, 0, (i+1).to_s)
      end
      table.setItemText(0, 1, 'Абдюков П. М.')
      table.setItemText(1, 1, 'Крутов Я. П.')
      table.setItemText(2, 1, 'Наговский В. К.')
      table.setItemText(3, 1, 'Мишин М. М.')
      table.setItemText(4, 1, 'Челов А. А.')
      table.setItemText(5, 1, 'Абдюков П. М.')
      table.setItemText(6, 1, 'Крутов Я. П.')
      table.setItemText(7, 1, 'Наговский В. К.')
      table.setItemText(8, 1, 'Мишин М. М.')
      table.setItemText(9, 1, 'Челов А. А.')

      table.setItemText(0, 2, 'LKhnfewf')
      table.setItemText(1, 2, 'slfkj')
      table.setItemText(2, 2, 'Yfjd')
      table.setItemText(3, 2, 'Foenf')
      table.setItemText(4, 2, 'LKJG')
      table.setItemText(5, 2, 'Hhoster')
      table.setItemText(6, 2, 'Jod')
      table.setItemText(7, 2, 'Rnkg')
      table.setItemText(8, 2, 'Clen')
      table.setItemText(9, 2, 'chel')

      table.setItemText(0, 3, '89055955990')
      table.setItemText(1, 3, '89055934990')
      table.setItemText(2, 3, '89055955945')
      table.setItemText(3, 3, '89055958760')
      table.setItemText(4, 3, '89055955560')
      table.setItemText(5, 3, '89055955956')
      table.setItemText(6, 3, '89055955453')
      table.setItemText(7, 3, '89055955456')
      table.setItemText(8, 3, '89055955932')
      table.setItemText(9, 3, '89055955989')
    end

    def get_select_rows
      self.table.selEndRow - self.table.selStartRow
    end

    def check_combobox(combobox,text)
      combobox.connect(SEL_COMMAND) do |sender, sel, index|
        text.editable = false if sender.currentItem !=1
        text.editable = true if sender.currentItem == 1 
      end      
    end

    def table_empty
      (0..9).each do |i|
        (0..3).each do |j|
          self.table.setItemText(i,j,"")
        end
      end
    end

    def create
      super
      show(PLACEMENT_SCREEN)
    end

end