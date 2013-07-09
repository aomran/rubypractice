# def lowerize(word, n=0)
# 	 word[0, n] + word[n].downcase + word[n+1, word.length]
# end

# def upperize(word, n=0)
# 	word[0, n] + word[n].upcase + word[n+1, word.length]
# end

def consonant?(letter)
	"bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ".include?(letter)
end

def leet_num?(letter)
		"aeioAEIO0123456789".include?(letter)
end


def leet_speak(input)
	leet_phrase = input.split
	
	# Words that start with a consonant start with lower case
	leet_phrase.map! do |word|
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
		# if consonant?(word[0]) then lowerize(word)
		# else; word; end
	end
	
	# Consonants after the first letter alternate upper and lower case, except the alternation starts over with lowercase after a digit 


	# Several vowels are always replaced with numbers: a = 4, e = 3, i = 1, o = 0
	leet_phrase.join(" ").gsub(/[a,A]/, "4").gsub(/[e,E]/, "3").gsub(/[i,I]/, "1").gsub(/[o,O]/, "0")
end

loop do
	inputs = gets # take in input
	break if /[B|b]ye\n/ =~ inputs #exit loop when instructed

	if /^Bro, (.+)/ =~ inputs then puts leet_speak($1)
	elsif inputs.include?("?") then puts "Sure."
	elsif inputs.strip.empty? then puts 'Fine. Be that way!'
	elsif inputs == inputs.upcase then puts 'Woah, chill out!'
	else; puts 'Whatever.'
	end
end