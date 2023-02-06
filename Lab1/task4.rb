def cyclic_shift(mass) #сдвигает элементы массива на один в право
	return mass[0...-1].unshift(mass[-1])
end

def count_evan(mass) #возвращает количество четных элементов
	return mass.reduce(0) {|count, x| x % 2 == 0 ? count+=1 : count}
end

def count_min_el(mass) #возвращает количество минимальных элементов
	min = mass.min
	return mass.reduce(0) {|count, x| min == x ? count+=1 : count} 
end 

def sort_by_count(mass) #сортирует по частоте встречаемости элементов (по убыванию)
	return mass.sort_by {|x| mass.count(x)}.reverse
end

def select_method(num_method, file_name) #функция принимает два значения номер функция и имя файла (путь) с массивом чисел возвращает значение выбраной функции указаного массива 
	mass = IO.read(file_name).split.map(&:to_i)
	case num_method
		when "1"
			return cyclic_shift(mass)
		when "2"
			return count_evan(mass)
		when "3"
			return count_min_el(mass)
		when "4" 
			return sort_by_count(mass)
	end
end

puts select_method(ARGV[0], ARGV[1])