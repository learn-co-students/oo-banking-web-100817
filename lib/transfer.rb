require 'pry'

class Transfer
  #one instance of BankAccount
  #can transfer to another Bank Account
  #check the validity of the accounts
  #before the transfer occurs
  #able to reject a transfer if the
  #accounts aren't valid OR the sender
  #doesn't have the money
  #start in pending status
  #can execute to complete status or rejected status
  #a completed transfer can also be reversed and go into
  #a reversed status
  attr_accessor :bankaccount, :status, :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    @sender.valid? == true && @receiver.valid? == true
  end

  def execute_transaction
    if @status == "pending" && @sender.valid? && @sender.balance >= @amount
        @receiver.deposit(@amount)
        @sender.balance -= @amount
        @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete" && @receiver.valid? && @receiver.balance >= @amount
      @sender.deposit(@amount)
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
