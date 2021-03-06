require_relative './numtoword'

class Say

	def initialize(num)
		if num.to_s.size > 12 || num < 0
			raise ArgumentError, "Number out of 0 to 999,999,999,999 range"
		end
		@num = num
	end

	def stringify
		numstring = @num.to_s

		until numstring.size == 12
			numstring = "0" + numstring
		end

		numstring
	end

	def split
		numstring = stringify
		num_array = []

		until numstring.size == 0
		num_array << numstring.slice!(/\d\d\d/).to_i
		end

		num_array
	end

	def say_magnitude
		num_array = split

		first_part = if num_array[0] != 0
			NumToWord.new(num_array[0].to_i).in_english + " billion "
		else
			""
		end

		second_part = if num_array[1] != 0
			NumToWord.new(num_array[1].to_i).in_english + " million "
		else
			""
		end

		third_part = if num_array[2] != 0
			NumToWord.new(num_array[2].to_i).in_english + " thousand "
		else
			""
		end

		"#{first_part}#{second_part}#{third_part}" + NumToWord.new(num_array[3]).in_english
	end

end