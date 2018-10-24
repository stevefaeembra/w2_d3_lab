class Customer

  attr_reader :name

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
  end

  def get_wallet
    return @wallet 
  end




end
