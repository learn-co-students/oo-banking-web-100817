class Transfer
    attr_accessor :status, :sender, :receiver, :amount, :bankaccount

    def initialize(sender, receiver, amount)
      @amount = amount
      @status = 'pending'
      @sender = sender
      @receiver = receiver
    end

    def valid?
      @sender.valid? == true && @receiver.valid? == true
    end

    def execute_transaction
      if @status == 'pending' && @sender.valid? && @sender.balance >= @amount
        @receiver.deposit(@amount)
        @sender.balance -= @amount
        @status = 'complete'
      else
        @status = 'rejected'
        "Transaction rejected. Please check your account balance."
      end
    end

    def reverse_transfer
      if @status == 'complete' && @sender.valid?
        self.sender.deposit(@amount)
        self.receiver.balance -= @amount
        self.status = 'reversed'
      end
    end
end
