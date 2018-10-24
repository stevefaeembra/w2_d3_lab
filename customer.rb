class Customer

  attr_reader :name

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
  end

  def get_wallet
    return @wallet
  end

  def enquire_drink_price(pub, drink_name)
    pub.look_up_drink(drink_name)
  end

  def can_afford?(amount)
    amount <= @wallet
  end

  def pay_out(amount)
    @wallet -= amount
  end

  def buy_drink(pub, drink_name)
    price = enquire_drink_price(pub, drink_name)
    if can_afford?(price)
      pub.till_sale(drink_name)
      pay_out(price)
    end
  end

end
