require "minitest/autorun"
require "minitest/reporters"
require_relative "1.rb"

Minitest::Reporters.use!

class TestCalc < Minitest::Test

  def test_several
    tests = [
    ['1+1', 2],
    ['1 - 1', 0],
    ['1* 1', 1],
    ['1 /1', 1],
    ['-123', -123],
    ['123', 123],
    ['2 /2+3 * 4.75- -6', 21.25],
    ['12* 123', 1476],
    ['2 / (2 + 3) * 4.33 - -6', 7.732]]
    tests.each do |pair|
      assert_equal(pair[1], calc(pair[1]))
    end
  end

end