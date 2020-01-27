class Statement

  def initialize
    @transactions = []
  end

  def print
    result = "date || credit || debit || balance"
    @transactions.each { |t|
      result += "\n#{t.date} || #{t.credit} || #{t.debit} || #{t.balance}"
    }
    return result
  end

  def add(transaction)
    @transactions << transaction
  end

end
