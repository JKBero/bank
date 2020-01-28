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

end
