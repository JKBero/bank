require 'account'

describe Account do

  subject(:account) { Account.new }

  it 'starts with a balance of 0' do
    expect(account.balance).to eq 0
  end

  it 'increases the balance by 5 when 5 is deposited' do
    account.deposit(5)
    expect(account.balance).to eq 5
  end

  it 'decreases the balance by 5 when 5 is withdrawn' do
    account.deposit(20)
    account.withdraw(5)
    expect(account.balance).to eq 15
  end

end
