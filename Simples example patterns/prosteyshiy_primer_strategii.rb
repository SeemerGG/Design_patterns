class Glavniy
	def op1
		puts "�������� ��������"
	end
end

class Child1 < Glavniy
	def op1 
		super
		puts "�������� ������� ����������"
	end
end

class Child2 < Glavniy
	def op1 
		super
		puts "�������� ������� ����������"
	end
end

