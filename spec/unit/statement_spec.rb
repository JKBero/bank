require 'statement'

describe Statement do

  subject(:statement) { Statement.new }
  let(:transaction) { double :transaction, date: '27/01/2019', credit: '100.00', debit: nil, balance: '100.00' }
  let(:transaction2) { double :transaction, date: '28/01/2019', credit: nil, debit: '50.50', balance: '49.50' }

  describe '#print' do

    it 'shows an empty account statement when there have been no transactions' do
      result = "date || credit || debit || balance"
      expect(statement.print).to eq result
    end

    it 'shows one transaction when account has been deposited into for the first time' do
      statement.add(transaction)
      headers = "date || credit || debit || balance"
      tran = "27/01/2019 || 100.00 || || 100.00"
      expect(statement.print).to eq headers + "\n" + tran
    end

    it 'shows two transactions in reverse chronological order' do
      statement.add(transaction)
      statement.add(transaction2)
      headers = "date || credit || debit || balance"
      tran = "27/01/2019 || 100.00 || || 100.00"
      tran2 = "28/01/2019 || || 50.50 || 49.50"
      expect(statement.print).to eq headers + "\n" + tran2 + "\n" + tran
    end
  end

end
