class Statement

  def initialize
    @transactions = []
  end

  def print
    result = "date || credit || debit || balance"
    @transactions.each { |t|
      if t.credit != '0.00'
        result += "\n#{t.date} || #{t.credit} || || #{t.balance}"
      else
        result += "\n#{t.date} || || #{t.debit} || #{t.balance}"
      end
    }
    return result
  end

  def add(transaction)
    @transactions.unshift(transaction)
  end

end
