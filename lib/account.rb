require 'statement'
require 'transaction'

class Account

  def initialize(statement_class = Statement)
    @balance = 0
    @statement = statement_class.new
    @overdrawn_error = "You do not have enough funds to withdraw this amount."
  end

  def deposit(amount, transaction_class = Transaction)
    @balance += amount
    transaction = transaction_class.new(balance: @balance, credit: amount)
    @statement.add(transaction)
    @balance
  end

  def withdraw(amount, transaction_class = Transaction)
    return @overdrawn_error if overdrawn?(amount)

    @balance -= amount
    transaction = transaction_class.new(balance: @balance, debit: amount)
    @statement.add(transaction)
    @balance
  end

  def statement
    @statement.print
  end

  private

  def overdrawn?(amount)
    amount > @balance
  end

end
