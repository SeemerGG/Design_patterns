class Glavniy
	def op1
		puts "Действие главного"
	end
end

class Child1 < Glavniy
	def op1 
		super
		puts "Действие первого наследника"
	end
end

class Child2 < Glavniy
	def op1 
		super
		puts "Действие второго наследника"
	end
end

