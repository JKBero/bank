require 'account'

describe 'User can view their current balance' do

  subject(:account) { Account.new }

  it 'shows 0 as the starting balance' do
    expect(account.balance).to eq 0
  end

  it 'shows 5 after depositing 5 in the account' do
    account.deposit(5)
    expect(account.balance).to eq 5
  end

  it 'shows 1 after 10 is deposited and 9 is withdrawn' do
    account.deposit(10)
    expect(account.balance).to eq 10

    account.withdraw(9)
    expect(account.balance).to eq 1
  end

end
