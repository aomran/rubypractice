class Chunks

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

end