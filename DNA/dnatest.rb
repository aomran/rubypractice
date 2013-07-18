require_relative './dna'
require 'minitest/autorun'
require 'minitest/pride'

class DNAtest < MiniTest::Unit::TestCase
	
	def setup
		@dna = DNA.new("ATGCTTCAGAAAGGTCTTACG")
	end
	
	def test_should_instantiate_with_string
		refute_nil @dna
	end

	def test_raises_argumenterror_bad_nucleotide
		assert_raises ArgumentError do
			@dna.count('S')
		end
	end

	def test_counts_single_nucleotides
		assert_equal 6, @dna.count('A')
	end

	def test_return_nucleotides_hash
		assert_equal @dna.nucleotide_counts, {'A' => 6, 'T' => 6, 'G' => 5, 'C' => 4}
	end

	def test_sample_dataset
		s = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
		dna = DNA.new(s)
		assert_equal dna.nucleotide_counts, {'A' => 20, 'T' => 21, 'G' => 17, 'C' => 12}
	end

	def test_raises_argumenterror_bad_sequence
		assert_raises ArgumentError do
			DNA.new("CHEALTLGO")
		end
	end

	def test_zero_nucleotide_count_deleted
		dna = DNA.new('AA')
		assert_equal dna.nucleotide_counts, {'A' => 2}
	end

end