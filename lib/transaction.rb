class Transaction

  attr_reader :date, :credit, :debit, :balance

  def initialize(balance:, credit: 0, debit: 0)
    @date = Date.today.strftime('%d/%m/%Y')
    @credit = sprintf('%.2f', credit)
    @debit = sprintf('%.2f', debit)
    @balance = sprintf('%.2f', balance)
  end

end
