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
    self.sender.valid? && self.receiver.valid?
  end

  def overdrawn?
    balance = self.sender.balance
    new_balance = balance - self.amount
    new_balance < 0
  end

  def execute_transaction
      if self.status == "pending" && !self.overdrawn?
        self.sender.balance -= self.amount
        self.receiver.balance += self.amount
        self.status = "complete"
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
      if self.status == "complete"
        self.sender.balance += self.amount
        self.receiver.balance -= self.amount
        self.status = "reversed"
      end
    end


end
