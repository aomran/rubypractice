class DNA

	def initialize(sequence)
		@sequence = sequence
		@nucleotides_hash = {'A' => 0, 'T' => 0, 'G' => 0, 'C' => 0, 'U' => 0}
		check_sequence
		increment_nucleotides_hash
	end

	def check_sequence
		@sequence.each_char do |char|
			unless @nucleotides_hash[char]
				raise ArgumentError, "That's not a DNA sequence!"
			end
		end
	end

	def increment_nucleotides_hash
		@sequence.each_char do |char|
			@nucleotides_hash[char] += 1
		end
	end

	def count(nucleotide)
		unless @nucleotides_hash[nucleotide]
			raise ArgumentError, "That's not a nucleotide, silly!"
		end

		@nucleotides_hash[nucleotide]

	end

	def nucleotide_counts
		@nucleotides_hash.reject {| key, value | value == 0 }
	end
	
end