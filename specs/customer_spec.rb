require('minitest/autorun')
require('minitest/rg')
require_relative('../customer')

class CustomerTest < MiniTest::Test

  def setup
    @customer1 = Customer.new("Jenny", 10)
  end

  def test_customer_exists
    assert_equal(Customer, @customer1.class)
  end

  def test_customer_name_correct
    assert_equal("Jenny", @customer1.name)
  end

  def test_customer_wallet_correct
    assert_equal(10, @customer1.get_wallet)
  end


end
