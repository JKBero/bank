require 'statement'

describe Statement do

  subject(:statement) { Statement.new }
  let(:transaction) { double :transaction, date: '27/01/2019', credit: '100.00', debit: '', balance: '100.00' }

  describe '#print' do

    it 'shows an empty account statement when there have been no transactions' do
      result = "date || credit || debit || balance"
      expect(statement.print).to eq result
    end

    it 'shows a transaction when account has been deposited into for the first time' do
      statement.add(transaction)
      headers = "date || credit || debit || balance"
      transaction = "27/01/2019 || 100.00 ||  || 100.00"
      expect(statement.print).to eq headers + "\n" + transaction
    end
  end

end
