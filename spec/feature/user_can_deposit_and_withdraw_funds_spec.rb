require 'account'

describe 'User can deposit and withdraw funds' do

  subject(:account) { Account.new }

  it 'returns a balance of 5 after depositing 5 in the account' do
    expect(account.deposit(5)).to eq 5
  end

  it 'returns a balance of 1 after 10 is deposited and 9 is withdrawn' do
    account.deposit(10)
    expect(account.withdraw(9)).to eq 1
  end

  it 'returns a correct balance after several account transactions' do
    account.deposit(1000.99)
    account.withdraw(95)
    account.withdraw(40)
    account.deposit(90.50)
    account.withdraw(20)
    expect(account.withdraw(225)).to eq 711.49
  end

end
