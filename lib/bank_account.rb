class BankAccount

  attr_accessor :balance, :status

  attr_reader :name



  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"

  end



  def deposit(cash)
    @balance += cash
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    if self.balance > 0 && self.status != 'closed'
      true
    else
    #  self.status = "closed"
     false
   end
  end

  def close_account
    self.status = 'closed'
  end





end
