def prost(digit)
	for i in 2...digit do
		if digit%i == 0 
			return false
		end
	end 
	return true
end 

def sum_prost(digit)
	sum = 0
	for i in 2..digit do
		if digit%i == 0 && prost(i)
			sum += i
		end
	end
	return sum
end 

def count_no_even(digit)
	digit.each_char.map(&:to_i).reduce(0) {|sum, digit| digit%2!=0 && digit > 3? sum +=1: sum}
end

def mult_del(digit)
	sum_digit = digit.each_char.map(&:to_i).sum
	p = 1
	digit = digit.to_i
	for i in 1..digit
		if digit%i == 0 && i.to_s.each_char.map(&:to_i).sum > sum_digit
			p *= i
		end	
	end
	return p
end

puts "Сумма простых делителей числа: #{sum_prost(ARGV[0].to_i)}"
puts "Количество нечетных цифр, больших 3: #{count_no_even(ARGV[0])}"
puts "Произведение таких делителей числа, сумма цифр которых меньше, чем сумма цифр исходного числа: #{mult_del(ARGV[0])}"