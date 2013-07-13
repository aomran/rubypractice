require_relative './pACalc'
require 'minitest/autorun'
require 'minitest/pride' # pride adds rainbow colors

class CalculatorTest < MiniTest::Unit::TestCase
  def setup #run at the beginning of every test

    @calculator = Calculator.new
  end

  def test_strip_irrelevant_words
    assert_equal ["23", "plus", "24"], @calculator.strip_irrelevant_words('What is 23 plus 24?')
  end

  def test_strip_irrelevant_words_long
    assert_equal ["23", "plus", "24", "plus", "53"], @calculator.strip_irrelevant_words('What is 23 plus 24 plus 53?')
  end

  def test_convert_to_math_syntax_with_plus
    assert_equal [23, :+, 24], @calculator.convert_to_math_syntax(["23", "plus", "24"])
  end

  def test_convert_to_math_syntax_with_minus
    assert_equal [23, :-, 24], @calculator.convert_to_math_syntax(["23", "minus", "24"])
  end

  def test_convert_to_math_syntax_with_multiplied_by
    assert_equal [23, :*, 24], @calculator.convert_to_math_syntax(["23", "multiplied", "by", "24"])
  end

  def test_convert_to_math_syntax_with_divided_by
    assert_equal [23, :/, 24], @calculator.convert_to_math_syntax(["23", "divided", "by", "24"])
  end

  def test_convert_to_math_syntax_with_two_signs
    assert_equal [23, :+, 24, :+, 11], @calculator.convert_to_math_syntax(["23", "plus", "24", "plus", "11"])
  end

  def test_add_two_numbers
    assert_equal 33, @calculator.calculate([23, :+, 10])
  end

  def test_subtract_two_numbers
    assert_equal 13, @calculator.calculate([23, :-, 10])
  end


  def test_multiply_two_numbers
    assert_equal 230, @calculator.calculate([23, :*, 10])
  end

  def test_divide_two_numbers
    assert_equal 29, @calculator.calculate([290, :/, 10])
  end

  def test_add_three_numbers
    assert_equal 67, @calculator.calculate([23, :+, 10, :+, 34])
  end

  def test_a_times_b_plus_c
    assert_equal 235, @calculator.calculate([23, :*, 10, :+, 5])
  end

  def test_a_divided_by_b_minus_c
    assert_equal 3, @calculator.calculate([80, :/, 10, :-, 5])
  end

  def test_a_plus_b_times_c
    assert_equal 73, @calculator.calculate([23, :+, 10, :*, 5])
  end

  def test_a_minus_b_times_c
    assert_equal -27, @calculator.calculate([23, :-, 10, :*, 5])
  end

  def test_a_minus_b_divided_by_c
    assert_equal 21, @calculator.calculate([23, :-, 10, :/, 5])
  end
end