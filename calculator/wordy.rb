class Calculator

	def ask(phrase)
		if /^What is (?<num1>-*\d+) plus (?<num2>-*\d+)\s*(plus (?<num3>-*\d+))?/ =~ phrase
			num1.to_i + num2.to_i + num3.to_i
		else
			"Error"
		end
	end
end

class WordProblem

	def initialize(phrase)
		@phrase = phrase
		@pattern = /What is (-*\d+) (plus|minus|multiplied|divided)\s?b?y? (-*\d+)?/
	end

	def parse
		regex_array = @phrase.match(@pattern).to_a

		if regex_array[2] == 'plus'
			regex_array << :+
		elsif regex_array[2] == 'minus'
			regex_array << :-
		elsif regex_array[2] == 'multiplied'
			regex_array << :*
		elsif regex_array[2] == 'divided'
			regex_array << :/
		end

		regex_array
	end

	def calculate(regex_array)
		regex_array[1].to_i.send(regex_array[4], regex_array[3].to_i)
	end

	def answer
		if @phrase.match(@pattern)
			calculate(parse)
		else
			raise ArgumentError
		end
	end

end