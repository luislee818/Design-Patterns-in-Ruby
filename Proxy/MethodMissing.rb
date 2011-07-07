require 'etc'
require_relative 'subject'

class MethodMissingProtectionProxy
  def initialize(account, owner)
    @account = account
    @owner = owner
  end

  def method_missing(name, *args)
    check_access
    @account.send(name, *args)
  end

  def check_access
    if Etc.getlogin != @owner
      raise "Illegal access: #{Etc.getlogin} cannot access account"
    end
  end
end

class MethodMissingVirtualProxy
  def initialize(&initializer)
    @initializer = initializer
  end

  def method_missing(name, *args)
    subject.send(name, *args)
  end

  def subject
    return @subject || (@subject = @initializer.call)
  end
end

account = BankAccount.new(15)
protectionAccount = MethodMissingProtectionProxy.new(account, "dpli")
protectionAccount.deposit(3)
puts protectionAccount.balance

virtualAccount = MethodMissingVirtualProxy.new { BankAccount.new(15) }
virtualAccount.deposit(2)
puts virtualAccount.balance
