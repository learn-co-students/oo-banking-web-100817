class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender,receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @reverse_counter = 0
    @transfer_counter = 0
  end
  # your code here

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if @transfer_counter == 0
      if valid? && sender.balance > @amount
        sender.balance -= @amount
        receiver.balance += @amount
        @status = "complete"
        @transfer_counter += 1
      else
      @status = "rejected"
      @transfer_counter += 1
      "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer
    if @reverse_counter == 0 && @transfer_counter == 1
    sender.balance += @amount
    receiver.balance -= @amount
    @status = "reversed"
    @reverse_counter +=1
    end
  end


end
