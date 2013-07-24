require_relative '../lib/say'
require 'minitest/autorun'
require 'minitest/pride'

class SayTest < MiniTest::Unit::TestCase

	def test_instant_requires_argument
		refute_nil Say.new(1000)
	end

	def test_Say_has_method_split
		assert_respond_to Say.new(12), :split
	end

	def test_add_zeros_to_make_12_12_chars
		assert_equal Say.new(12).stringify, "000000000012"
	end

	def test_add_zeros_to_make_5500_12_chars
		assert_equal Say.new(5500).stringify, "000000005500"
	end

	def test_will_split_hundred
		assert_equal [0,0,0,100], Say.new(100).split
	end

	def test_will_split_thousand
		assert_equal [0,0,1,000], Say.new(1000).split
	end

	def test_will_split_1234567890
		assert_equal [1, 234, 567, 890], Say.new(1234567890).split
	end

	def test_will_split_966802
		assert_equal [0, 0, 966, 802], Say.new(966802).split
	end

	def test_error_for_negative_number
		assert_raises ArgumentError do
			Say.new(-1)
		end
	end

	def test_error_for_number_out_of_range
		assert_raises ArgumentError do
			Say.new(20100000000000)
		end
	end

	def test_say_magnitude_1234567890
		assert_equal "one billion two hundred and thirty-four million five hundred and sixty-seven thousand eight hundred and ninety", Say.new(1234567890).say_magnitude
	end


	def test_say_magnitude_234567890
		assert_equal "two hundred and thirty-four million five hundred and sixty-seven thousand eight hundred and ninety", Say.new(234567890).say_magnitude
	end

	def test_say_magnitude_567890
		assert_equal "five hundred and sixty-seven thousand eight hundred and ninety", Say.new(567890).say_magnitude
	end

	def test_say_magnitude_890
		assert_equal "eight hundred and ninety", Say.new(890).say_magnitude
	end

	def test_say_magnitude_12345
		assert_equal "twelve thousand three hundred and forty-five", Say.new(12345).say_magnitude
	end

	def test_1_million_2_thousand_345
    assert_equal 'one million two thousand three hundred and forty-five', Say.new(1002345).say_magnitude
  end
end