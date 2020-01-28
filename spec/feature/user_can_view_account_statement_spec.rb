describe 'User can view their account statement' do

  subject(:account) { Account.new }

  before do
    allow(Date).to receive(:today) { Date.new(2019, 1, 27) }
  end

  it 'shows an empty statement when account is brand new' do
    result = "date || credit || debit || balance"
    expect { account.statement }.to output(result).to_stdout
  end

  it 'shows one transaction after first deposit into account' do
    account.deposit(100)
    headers = "date || credit || debit || balance"
    transaction = "27/01/2019 || 100.00 || || 100.00"

    expect { account.statement }.to output(headers + "\n" + transaction).to_stdout
  end

  it 'shows two transactions after a deposit and then withdrawal' do
    account.deposit(100)

    allow(Date).to receive(:today) { Date.new(2019, 1, 30) }
    account.withdraw(99.99)

    headers = "date || credit || debit || balance"
    tran = "27/01/2019 || 100.00 || || 100.00"
    tran2 = "30/01/2019 || || 99.99 || 0.01"

    expect { account.statement }.to output(headers + "\n" + tran2 + "\n" + tran).to_stdout
  end

  it 'shows multiple transactions after several deposits and withdrawals' do
    account.deposit(100)

    allow(Date).to receive(:today) { Date.new(2019, 1, 30) }
    account.withdraw(50)

    allow(Date).to receive(:today) { Date.new(2019, 2, 4) }
    account.withdraw(50)

    allow(Date).to receive(:today) { Date.new(2019, 2, 6) }
    account.deposit(250)

    headers = "date || credit || debit || balance"
    tran = "27/01/2019 || 100.00 || || 100.00"
    tran2 = "30/01/2019 || || 50.00 || 50.00"
    tran3 = "04/02/2019 || || 50.00 || 0.00"
    tran4 = "06/02/2019 || 250.00 || || 250.00"

    expect { account.statement }.to output(headers + "\n" + tran4 + "\n" + tran3 + "\n" + tran2 + "\n" + tran).to_stdout
  end

end
