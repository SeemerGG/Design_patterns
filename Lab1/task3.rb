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

def select_method(num_meth, file_name) #функция принимает два значения номер функция и имя файла (путь) с массивом чисел возвращает значение выбраной функции указаного массива 
	mass = IO.read(file_name).split.map(&:to_i) 
	case num_meth
		when "1"
			return min_el(mass)
		when "2"
			return first_pos_el(mass)
	end
end 

puts select_method(ARGV[0], ARGV[1])