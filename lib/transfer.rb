class Transfer
  attr_accessor :sender,:receiver,:amount,:status
  # your code here
  def initialize(sender,receiver,amount = 0)
    @sender=sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if sender.balance >=  self.amount
      # binding.pry
      if self.status == "pending"
        sender.balance -= self.amount
        receiver.deposit(self.amount)
        self.status = "complete"
      end
      # binding.pry
    else
      self.status = "rejected"
      sender.status = "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if receiver.balance >=  self.amount
      if self.status == "complete"
        receiver.balance -= self.amount
        sender.deposit(self.amount)
        self.status = "reversed"
      end
    else
      self.status = "rejected"
      receiver.status = "Transaction rejected. Please check your account balance."
    end
  end

end
