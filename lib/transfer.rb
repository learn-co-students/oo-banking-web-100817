require 'pry'

class Transfer

  attr_reader :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @last_transfer = 0
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @sender.valid? && @sender.balance >= @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
      @last_transfer = @amount
      @amount = 0

    else
      @status = "rejected"
     return "Transaction rejected. Please check your account balance."
   end
  end

  def reverse_transfer
    @sender.balance += @last_transfer
    @receiver.balance -= @last_transfer
    @status = "reversed"
  end

end
