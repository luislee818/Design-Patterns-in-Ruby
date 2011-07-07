require_relative 'subject'

class VirtualAccountProxy
  def initialize(&initializer)
    @initializer = initializer
  end

  def deposit(amount)
    s = subject
    s.deposit(amount)
  end

  def withdraw(amount)
    s = subject
    s.withdraw(amount)
  end

  def balance
    s = subject
    s.balance
  end

  def subject
    return @subject || (@subject = @initializer.call)
  end
end

virtualAccount = VirtualAccountProxy.new { BankAccount.new(15) }
virtualAccount.deposit(2)
puts virtualAccount.balance
