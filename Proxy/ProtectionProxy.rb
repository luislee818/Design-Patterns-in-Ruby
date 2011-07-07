require 'etc'
require_relative 'subject'

class AccountProtectionProxy
  def initialize(account, owner)
    @account = account
    @owner = owner
  end

  def deposit(amount)
    check_access
    @account.deposit(amount)
  end

  def withdraw(amount)
    check_access
    @account.withdraw(amount)
  end

  def balance
    check_access
    return @account.balance
  end

  def check_access
    if Etc.getlogin != @owner
      raise "Illegal access: #{Etc.getlogin} cannot access account"
    end
  end
end

account = BankAccount.new(15)
proxy = AccountProtectionProxy.new(account, "dpli")
proxy.deposit(2)
puts proxy.balance
