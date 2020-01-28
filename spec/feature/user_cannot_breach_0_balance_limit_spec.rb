describe 'User cannot breach 0 balance limit' do

  subject(:account) { Account.new }

  describe 'on first creation of account' do
    it 'shows an error message when user tries to overdraw on their account' do
      error = "You do not have enough funds to withdraw this amount."
      expect(account.withdraw(10)).to eq error
    end
  end

  describe 'after the first deposit into account' do
    it 'shows an error message when user tries to overdraw on their account' do
      account.deposit(1000)
      expect(account.withdraw(950)).to eq 50
      expect(account.withdraw(50)).to eq 0
      expect(account.deposit(25)).to eq 25

      error = "You do not have enough funds to withdraw this amount."
      expect(account.withdraw(26)).to eq error
    end
  end

end
