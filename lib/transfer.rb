class Transfer
# two var
# status = pending
  attr_reader :sender, :receiver

  attr_accessor :status, :amount, :completed_transfer_amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?

    if self.sender.valid? && self.receiver.valid?
      true
    else
      false
    end
  end


  def execute_transaction
    if self.valid? && self.sender.balance >= self.amount
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = 'complete'
      self.completed_transfer_amount = self.amount
      self.amount = 0
    else
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == 'complete'
      self.sender.balance += self.completed_transfer_amount
      self.receiver.balance -= self.completed_transfer_amount
      self.status = "reversed"
    end
  end
end
