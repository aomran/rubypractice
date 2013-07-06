def div3(num)
	num % 3 == 0
end

def div5(num)
	num % 5 == 0
end

1.upto(100) do |i|
	if div3(i) && div5(i) then puts "fizzbuzz"
	elsif div3(i) then puts "fizz"
	elsif div5(i) then puts "buzz"
	else; puts i; end
end

# 1.upto(100) do |i|
# 	if div3(i)
# 		if div5(i) then puts "fizzbuzz"
# 		else; puts "fizz"; end
# 	elsif div5(i) then puts "buzz"
# 	else; puts i; end	
# end