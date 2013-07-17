require_relative './chunks'
require 'minitest/autorun'
require 'minitest/pride'

class ChunksTest < MiniTest::Unit::TestCase

	def test_instant_requires_argument
		refute_nil Chunks.new(1000)
	end

	def test_chunks_has_method_split
		assert_respond_to Chunks.new(12), :split
	end

	def test_add_zeros_to_make_12_12_chars
		assert_equal Chunks.new(12).stringify, "000000000012"
	end

	def test_add_zeros_to_make_5500_12_chars
		assert_equal Chunks.new(5500).stringify, "000000005500"
	end

	def test_will_split_hundred
		assert_equal [0,0,0,100], Chunks.new(100).split
	end

	def test_will_split_thousand
		assert_equal [0,0,1,000], Chunks.new(1000).split
	end

	def test_will_split_1234567890
		assert_equal [1, 234, 567, 890], Chunks.new(1234567890).split
	end

	def test_will_split_966802
		assert_equal [0, 0, 966, 802], Chunks.new(966802).split
	end

	def test_error_for_negative_number
		assert_raises ArgumentError do
			Chunks.new(-1)
		end
	end

	def test_error_for_number_out_of_range
		assert_raises ArgumentError do
			Chunks.new(20100000000000)
		end
	end

	def test_say_magnitude_1234567890
		assert_equal "1 billion 234 million 567 thousand 890", Chunks.new(1234567890).say_magnitude
	end


	def test_say_magnitude_234567890
		assert_equal "234 million 567 thousand 890", Chunks.new(234567890).say_magnitude
	end

	def test_say_magnitude_567890
		assert_equal "567 thousand 890", Chunks.new(567890).say_magnitude
	end

	def test_say_magnitude_890
		assert_equal "890", Chunks.new(890).say_magnitude
	end

	def test_1_million_2_thousand_345
    assert_equal '1 million 2 thousand 345', Chunks.new(1002345).say_magnitude
  end
end