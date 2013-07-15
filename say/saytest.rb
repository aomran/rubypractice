require_relative './say'
require 'minitest/autorun'
require 'minitest/pride'

class SayTest < MiniTest::Unit::TestCase

  def test_0_returns_word
    assert_equal "zero", Say.new(0).in_english
  end

  def test_14_returns_word
    assert_equal "fourteen", Say.new(14).in_english
  end

  def test_50_returns_word
    assert_equal "fifty", Say.new(50).in_english
  end

  def test_98_returns_word
    assert_equal "ninety-eight", Say.new(98).in_english
  end

  def test_100_returns_word
    assert_equal "one hundred", Say.new(100).in_english
  end

  def test_108_returns_word
    assert_equal "one hundred and eight", Say.new(108).in_english
  end

  def test_114_returns_error
    assert_raises ArgumentError do
    	Say.new(114).in_english
    end 
  end

  # Number must be between 0 and 99, inclusive. (ArgumentError)
  def test_minus_1_returns_error
    assert_raises ArgumentError do
    	Say.new(-1).in_english
    end 
  end
end