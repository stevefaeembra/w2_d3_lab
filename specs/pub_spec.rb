require('minitest/autorun')
require('minitest/rg')
require_relative('../pub')
require_relative('../drink')
require_relative('../customer')

class PubTest < MiniTest::Test

  def setup
    @customer = Customer.new("Steve",50,19)
    @drink1 = Drink.new("Bacardi & Coke", 3)
    @drink2 = Drink.new("Small White Wine", 4)
    drinks = [@drink1, @drink2]
    @pub1 = Pub.new("The Red Lion", 500, drinks)
  end

  def test_pub_exists
    assert_equal(Pub, @pub1.class)
  end

  def test_pub_name
    assert_equal("The Red Lion", @pub1.name)
  end

  def test_till_balance
    assert_equal(500, @pub1.get_till)
  end

  def test_bar_stock
    assert_equal(2, @pub1.drinks.count)
  end

  def test_drink_name__drink1
    expected = "Bacardi & Coke"
    actual = @pub1.drinks[0].name
    assert_equal(expected, actual)
  end

  def test_drink_name__drink2
    expected = "Small White Wine"
    actual = @pub1.drinks[1].name
    assert_equal(expected, actual)
  end

  def test_look_up_drink
    expected = 4
    actual = @pub1.look_up_drink("Small White Wine")
    assert_equal(expected,actual)
  end

  def test_serve_drink_changes_till_value
    expected = 504
    @pub1.till_sale("Small White Wine")
    actual = @pub1.get_till
    assert_equal(expected, actual)
  end

  def test_customer_legal_age?
    expected = true
    actual = @pub1.legal_age?(@customer)
    assert_equal(expected, actual)
  end

end
