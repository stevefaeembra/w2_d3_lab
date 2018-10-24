require('minitest/autorun')
require('minitest/rg')
require_relative('../customer')
require_relative('../pub')
require_relative('../drink')


class CustomerTest < MiniTest::Test

  def setup
    @customer1 = Customer.new("Jenny", 10, 29)
    @drink1 = Drink.new("Bacardi & Coke", 3)
    @drink2 = Drink.new("Small White Wine", 4)
    drinks = [@drink1, @drink2]
    @pub1 = Pub.new("The Red Lion", 500, drinks)
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

  def test_customer_age
    assert_equal(29, @customer1.age)
  end

  def test_customer_enquire_drink
    assert_equal(4, @customer1.enquire_drink_price(@pub1, "Small White Wine"))
  end

  def test_can_afford__true
    assert_equal(true, @customer1.can_afford?(5))
  end

  def test_can_afford__exactly
    assert_equal(true, @customer1.can_afford?(10))
  end

  def test_can_afford__false
    assert_equal(false, @customer1.can_afford?(15))
  end

  def test_pay_out
    @customer1.pay_out(4)
    assert_equal(6, @customer1.get_wallet)
  end

  def test_customer_buys_drink
    @customer1.buy_drink(@pub1,"Small White Wine")

    expected = 6
    actual = @customer1.get_wallet
    assert_equal(expected, actual)
  end

end
