class BankAccount
  attr_accessor :balance, :status
  attr_reader :name
  def initialize(name)
    @balance = 1000
    @name = name
    @status = "open"
  end

  def deposit(amt)
    #money coming from transfer
    @balance += amt

  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    if @balance > 0 && @status == "open"
      true
    else false
    end
  end

  def close_account
    @status = "closed"
  end

end
