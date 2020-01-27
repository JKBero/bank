require 'account'

describe 'User can view their account statement' do

  subject(:account) { Account.new }

  it 'shows an empty statement when account is brand new' do
    statement = "date || credit || debit || balance"
    expect(account.statement).to eq statement
  end

end
