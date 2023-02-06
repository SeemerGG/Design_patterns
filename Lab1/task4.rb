def cyclic_shift(mass) #сдвигает элементы массива на один в право
	return mass[0...-1].unshift(mass[-1])
end

def count_evan(mass) #возвращает количество четных элементов
	return mass.reduce(0) {|count, x| x % 2 == 0 ? count+=1 : count}
end

