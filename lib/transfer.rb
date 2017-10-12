require 'pry'
class Transfer
  # your code here

  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @name
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if self.valid? && @amount < sender.balance && @status == 'pending'
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = 'complete'
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
