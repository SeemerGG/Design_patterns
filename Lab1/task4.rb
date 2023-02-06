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

