require 'minitest/autorun'
require 'minitest/reporters'
require_relative '6'

Minitest::Reporters.use!

class TestPerfect < Minitest::Test
  def test_raise_error
    error = assert_raises ArgumentError do
      PerfectNumber.new(-3).determine
    end
    
    assert_equal("Argument must be an integer > 0", error.message)
  end

  def test_classify_deficient
    assert_equal 'deficient', PerfectNumber.new(13).classify
  end

  def test_classify_perfect
    assert_equal 'perfect', PerfectNumber.new(28).classify
  end

  def test_classify_abundant
    assert_equal 'abundant', PerfectNumber.new(12).classify
  end
end