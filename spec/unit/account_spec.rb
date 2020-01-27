require 'account'

describe Account do

  subject(:account) { Account.new }

  describe '#balance' do
    it 'starts with a balance of 0' do
      expect(account.balance).to eq 0
    end
  end

  describe '#deposit' do
    it 'increases the balance by 5 when 5 is deposited' do
      account.deposit(5)
      expect(account.balance).to eq 5
    end
  end

  describe '#withdraw' do
    it 'decreases the balance by 5 when 5 is withdrawn' do
      account.deposit(20)
      account.withdraw(5)
      expect(account.balance).to eq 15
    end
  end

  describe '#statement' do
    it 'shows an empty account statement on first creation of account' do
      statement = "date || credit || debit || balance"
      expect(account.statement).to eq statement
    end
  end

end
