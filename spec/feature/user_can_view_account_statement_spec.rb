require 'account'
require 'statement'

describe 'User can view their account statement' do

  subject(:account) { Account.new }

  before do
    allow(Date).to receive(:today) { Date.new(2019, 27, 01) }
  end

  it 'shows an empty statement when account is brand new' do
    result = "date || credit || debit || balance"
    expect(account.statement).to eq result
  end

  # it 'shows a transaction when account has been used once' do
  #   account.deposit(100)
  #   headers = "date || credit || debit || balance"
  #   transaction = "27/01/2019 || 100.00 ||  || 100.00"
  #   expect(account.statement).to eq headers + "\n" + transaction
  # end

end
