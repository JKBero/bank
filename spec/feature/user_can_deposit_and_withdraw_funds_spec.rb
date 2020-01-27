require 'account'

describe 'User can deposit and withdraw funds' do

  subject(:account) { Account.new }

  it 'balance is 1 after 10 is deposited and 9 is withdrawn' do
    account.deposit(10)
    expect(account.withdraw(9)).to eq 1
  end

end
