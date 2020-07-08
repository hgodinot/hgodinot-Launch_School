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
  
  def test_give_receipt
    assert_output("You've paid $#{@transaction.item_cost}.\n") do
      @cash.give_receipt(@transaction)
    end
  end
end

class TransactionTest < Minitest::Test
  def setup
    @cash = CashRegister.new(100)
    @transaction = Transaction.new(50)
    @transaction.amount_paid = 70
  end
  
  def test_prompt_for_payment
    input = StringIO.new('70\n')
    @transaction.prompt_for_payment(input: input)
    assert_equal 70, @transaction.amount_paid
  end
end