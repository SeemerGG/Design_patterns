def min_el(mass) #функция принимает массив чисел и находит в нем минимальный элемент
	min = mass[0]
	for i in mass do 
		min > i ? min = i : min = min 
	end
	return min
end


def first_pos_el(mass) #функция принимает массив чисел и находит номер первого положительного элемента
	i = 0
	while i < mass.size
		mass[i] > 0 ? (return i) : i += 1
	end
end

mass = ARGV.map(&:to_i)
puts min_el(mass), "  " , first_pos_el(mass) 