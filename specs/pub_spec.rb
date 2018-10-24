require('minitest/autorun')
require('minitest/rg')
require_relative('../pub')
require_relative('../drink')

class PubTest < MiniTest::Test

  def setup
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

  def test_till_opening_balance
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

end
