require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

require_relative 'car'

class CarTest < Minitest::Test
  def setup
    @car = Car.new
    @car2 = Car.new
  end
  def test_wheels
    assert_equal(4, @car.wheels)
  end
  def test_nil
    assert_nil(@car.name)
  end
  def test_cars
    assert_equal(@car, @car2)
  end
end