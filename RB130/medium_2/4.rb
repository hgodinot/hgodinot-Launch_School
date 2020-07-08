require 'minitest/autorun'
require 'minitest/reporters'

require_relative 'cash_register'
require_relative 'transaction'

Minitest::Reporters.use!

class CashRegisterTest < Minitest::Test
  
  def setup
    @cash = CashRegister.new(100)
    @transaction = Transaction.new(50)
    @transaction.amount_paid = 70
  end
 
  def test_accept_money
    assert_equal(170, @cash.accept_money(@transaction))
  end
  
  def test_change
    assert_equal(20, @cash.change(@transaction))
  end
end