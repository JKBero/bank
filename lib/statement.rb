class Statement

  def initialize
    @transactions = []
  end

  def print
    result = "date || credit || debit || balance"
    @transactions.each { |t| result += view(t) }
    return result
  end

  def add(transaction)
    @transactions.unshift(transaction)
  end

  private

  def view(transaction)
    if transaction.credit != '0.00'
      "\n#{transaction.date} || #{transaction.credit} || || #{transaction.balance}"
    else
      "\n#{transaction.date} || || #{transaction.debit} || #{transaction.balance}"
    end
  end

end
