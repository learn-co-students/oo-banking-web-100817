require 'pry'

class Transfer

  attr_accessor :pending, :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @amount = amount
    @sender = sender
    @receiver = receiver
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
      if self.status == "pending" && self.sender.valid?
        self.sender.balance -= self.amount
        self.receiver.balance += self.amount
        self.status = "complete"
      elsif
        "Transaction rejected. Please check your account balance."
    end
  end

end
