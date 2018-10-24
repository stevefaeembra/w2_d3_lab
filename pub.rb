class Pub

  attr_reader :name, :drinks

  def initialize(name, till, drinks)
    @name = name
    @till = till
    @drinks = drinks
  end

  def get_till
    return @till
  end

  def look_up_drink(drink_name)
    for drink in @drinks
      if drink.name == drink_name
        return drink.price
      end
    end
  end

  def till_sale(customer, drink_name)
    if legal_age?(customer)
      price = look_up_drink(drink_name)
      @till += price
      return true
    else
      return false
    end
  end

  def legal_age?(customer)
    customer.age >= 18
  end

end
