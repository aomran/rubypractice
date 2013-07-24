require_relative '../lib/numtoword'
require 'minitest/autorun'
require 'minitest/pride'

class NumToWordTest < MiniTest::Unit::TestCase

  def test_0_returns_word
    assert_equal "zero", NumToWord.new(0).in_english
  end

  def test_14_returns_word
    assert_equal "fourteen", NumToWord.new(14).in_english
  end

  def test_50_returns_word
    assert_equal "fifty", NumToWord.new(50).in_english
  end

  def test_98_returns_word
    assert_equal "ninety-eight", NumToWord.new(98).in_english
  end

  def test_100_returns_word
    assert_equal "one hundred", NumToWord.new(100).in_english
  end

  def test_108_returns_word
    assert_equal "one hundred and eight", NumToWord.new(108).in_english
  end

  def test_189_returns_word
    assert_equal "one hundred and eighty-nine", NumToWord.new(189).in_english
  end

  def test_369_returns_word
    assert_equal "three hundred and sixty-nine", NumToWord.new(369).in_english
  end

  def test_723_returns_word
    assert_equal "seven hundred and twenty-three", NumToWord.new(723).in_english
  end

  def test_847_returns_word
    assert_equal "eight hundred and forty-seven", NumToWord.new(847).in_english
  end

  def test_890_returns_word
    assert_equal "eight hundred and ninety", NumToWord.new(890).in_english
  end

  def test_900_returns_word
    assert_equal "nine hundred", NumToWord.new(900).in_english
  end

  def test_above_or_equal_1000_returns_error
    assert_raises ArgumentError do
      NumToWord.new(1000).in_english
    end
  end

  def test_minus_1_returns_error
    assert_raises ArgumentError do
    	NumToWord.new(-1).in_english
    end
  end
end