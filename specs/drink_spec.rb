require('minitest/autorun')
require('minitest/rg')
require_relative('../drink')

class DrinkTest < MiniTest::Test

  def setup
    @drink1 = Drink.new("Hoegaarden",4,20)
  end

  def test_has_name
    assert_equal("Hoegaarden", @drink1.name)
  end

  def test_has_price
    assert_equal(4, @drink1.price)
  end

  def test_has_alcohol_level
    assert_equal(20, @drink1.alcohol_level)
  end

end
