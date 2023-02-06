def min_el(mass) #функция принимает массив чисел и находит в нем минимальный элемент
	min = mass[0]
	for i in mass do 
		min > i ? min = i : min = min 
	end
	return min
end



puts min_el(ARGV[0].each_char.map(&:to_i))