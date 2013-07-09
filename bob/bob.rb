class LeetString

	def initialize(phrase)
		@phrase = phrase.gsub(/^Bro, /, "")
	end

	def consonant?(letter)
		"bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ".include?(letter)
	end

	def leet_num?(letter)
			"aeioAEIO0123456789".include?(letter)
	end

	def replace_aeio_with_num(phrase)
		phrase.gsub(/[a,A]/, "4").gsub(/[e,E]/, "3").gsub(/[i,I]/, "1").gsub(/[o,O]/, "0")
	end

	def alternate_caps(phrase)
		# Words that start with a consonant start with lower case
		# Consonants after the first letter alternate upper and lower case,
		# except the alternation starts over with lowercase after a digit
		phrase.map! do |word|
			i = 0
			word.split("").map! do |letter|
				if consonant?(letter)
					if i.even? then letter.downcase!
					else
						letter.upcase!
					end
					i += 1 # so that the next consonant capitalization alternates
					letter
				elsif leet_num?(letter)
					i = 0 # reset after number
					letter
				else	
					letter
				end
			end.join
		end
	end

	def build_leet_phrase
		leet_phrase = alternate_caps(@phrase.split)
		leet_phrase = replace_aeio_with_num(leet_phrase.join(" "))
	end

	def to_s
		@leet_phrase ||= build_leet_phrase
	end

end


class Bob

	def question?(input)
		input.include?("?")
	end

	def statement?(input)
		input.length > 0
	end

	def shouting?(input)
		input == input.upcase
	end

	def nothing_said?(input)
		input.strip.empty?
	end

	def leet?(input)
		(/^Bro, / =~ input) == 0
	end

	def goodbye?(input)
		/[B|b]ye\n/ =~ input
	end

	def response_for(input)
		case true
		when leet?(input) then LeetString.new(input).to_s
		when question?(input) then "Sure."
		when nothing_said?(input) then 'Fine, be that way.'
		when shouting?(input) then 'Woah, chill out!'
		when statement?(input) then 'Whatever.'
		end
	end

end

# Creating the interactive Bob, a lackadaisical teenager who enjoys leet speak.

# loop do
# 	@bob = Bob.new
# 	input = gets # take in input
# 	break if @bob.goodbye?(input) #exit loop when instructed
# 	puts @bob.response_for(input)
# end