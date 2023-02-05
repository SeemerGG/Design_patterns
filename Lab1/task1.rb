puts "Hi, #{ARGV[0]}, which language do you like the most?"
case STDIN.gets.chomp
	when "Ruby"
		puts "Podliza"
	when "C#"
		puts "Goskiy type"
	else
		puts "Yaaasno"
end
puts "Input a command for Windows"
system STDIN.gets.chomp
puts "Input a command for Ruby"
eval STDIN.gets.chomp
