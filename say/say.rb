#!/usr/bin/env ruby
class Say

	NUM_WORDS = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"]

	UP_TO_19 = ["eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]

	TEENS = [nil, nil, "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety", "one hundred"]

	MINNUM = 0
	MAXNUM = 109
	def initialize(num)
		if num < 0 || num > 110
				raise ArgumentError, "Number must be between #{MINNUM} and #{MAXNUM}, inclusive."
		end
		@num = num	 
	end

	def in_english
		if @num <= 10 then NUM_WORDS[@num]
		elsif @num <= 19 then UP_TO_19[@num - 11]
		elsif @num % 10 == 0 then TEENS[@num/10]
		elsif @num > 20 && @num < 100
			"#{TEENS[@num/10]}-#{NUM_WORDS[@num%10]}"
		elsif @num > 100
				"#{TEENS[@num/10]} and #{NUM_WORDS[@num%10]}"
		end
	end
end

# number = Say.new(gets.to_i).in_english
# exec("say #{number}")