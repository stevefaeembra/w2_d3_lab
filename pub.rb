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

end
