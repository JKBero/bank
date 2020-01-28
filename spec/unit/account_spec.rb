require 'account'

describe Account do

  subject(:account) { Account.new }
  let(:statement) { double :statement, print: "date || credit || debit || balance" }

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

    it 'shows an error message if trying to withdraw below the 0 balance limit' do
      error = "You do not have enough funds to withdraw this amount."
      expect(account.withdraw(1)).to eq error
    end
  end

  describe '#statement' do
    it 'shows an empty account statement on first creation of account' do
      result = "date || credit || debit || balance"
      expect(account.statement).to eq result
    end
  end

end
