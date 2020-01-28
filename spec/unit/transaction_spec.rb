describe Transaction do

  subject(:transaction) { Transaction.new(balance: 50, credit: 25) }

  it 'has a date' do
    allow(Date).to receive(:today) { Date.new(2019, 1, 27) }
    expect(transaction.date).to eq "27/01/2019"
  end

  it 'holds a current balance figure' do
    expect(transaction.balance).to eq "50.00"
  end

  describe 'a credit transaction' do

    it 'has a credit amount to 2 decimal places' do
      expect(transaction.credit).to eq "25.00"
    end

    it 'has a default debit amount of 0' do
      expect(transaction.debit).to eq "0.00"
    end

  end

  describe 'a debit transaction' do

    subject(:transaction) { Transaction.new(balance: 50, debit: 40) }

    it 'has a default credit amount of 0' do
      expect(transaction.credit).to eq "0.00"
    end

    it 'has a debit amount to 2 decimal places' do
      expect(transaction.debit).to eq "40.00"
    end

  end

end
