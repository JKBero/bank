describe 'User cannot breach 0 balance limit' do

  subject(:account) { Account.new }

  it 'shows an error message when user tries to overdraw on their account' do
    error = "You do not have enough funds to withdraw this amount."
    expect(account.withdraw(10)).to eq error
  end

end
