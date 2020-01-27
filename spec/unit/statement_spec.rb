require 'statement'

describe Statement do

  subject(:statement) { Statement.new }

  describe '#print' do
    it 'shows an empty account statement when there have been no transactions' do
      result = "date || credit || debit || balance"
      expect(statement.print).to eq result
    end
  end

end
