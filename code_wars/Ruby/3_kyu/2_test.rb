require 'minitest/autorun'
require 'minitest/reporters'
require_relative '2_calculator'

Minitest::Reporters.use!

class TestCalculator < Minitest::Test
  def setup
    @calc = Calculator.new
  end
  
  def test_one
    assert_equal(@calc.evaluate("4 + 5"), 9)
  end
  
  def test_two
    assert_equal(@calc.evaluate("4 * 5"), 20)
  end
  
  def test_three
    assert_equal(@calc.evaluate("4 / 5"), 0.8)
  end
  
  def test_four
    assert_equal(@calc.evaluate("4 - 5"), -1)
  end
  
  def test_five
    assert_equal(@calc.evaluate("4 + 5 * 6"), 34)
  end
  
  def test_six
    assert_equal(@calc.evaluate("2 / 2 + 3 * 4 - 6"), 7)
  end
  
  def test_seven
    assert_equal(@calc.evaluate("2 / 2 + 3 * -4 - 6"), -17)
  end
  
  def test_eight
    assert_equal(@calc.evaluate("127"), 127)
  end
  
  def test_nine
    assert_equal(@calc.evaluate("10 * 5 / 2"), 25)
  end
  
  def test_ten
    assert_equal(@calc.evaluate("2 + 3 * 4 / 3 - 6 / 3 * 3 + 8"), 8)
  end
end