require 'account'

describe Account do

  subject(:account) { Account.new }

  describe '#deposit' do
    it 'increases the balance by 5 when 5 is deposited' do
      expect(account.deposit(5)).to eq 5
    end
  end

  describe '#withdraw' do
    it 'decreases the balance by 5 when 5 is withdrawn' do
      account.deposit(20)
      expect(account.withdraw(5)).to eq 15
    end
  end

  describe '#statement' do
    it 'shows an empty account statement on first creation of account' do
      statement = "date || credit || debit || balance"
      expect(account.statement).to eq statement
    end
  end

end
