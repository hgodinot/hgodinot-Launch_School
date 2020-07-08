require 'minitest/autorun'
require 'minitest/reporters'

require_relative 'cash_register'
require_relative 'transaction'

Minitest::Reporters.use!

class CashRegisterTest < Minitest::Test
  def setup
    @cash = CashRegister.new(100)
  end
  
  def test_total
    assert_equal(100, @cash.total_money)
  end

end