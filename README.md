# Bank

[![Build Status](https://travis-ci.com/jkbero/bank.svg?branch=master)](https://travis-ci.com/jkbero/bank)  

[Quick start](#quick-start) | [Versioning](#versioning) | [My approach](#my-approach) | [Code structure](#code-structure) | [Features](#features) | [Domain models](#domain-models) | [Code style](#code-style) | [Tech used](#tech-used) | [Test coverage](#test-coverage)

This software imitates a bank account, allowing the user to withdraw and deposit funds and read their bank statement. It is used in the terminal and is written in Ruby.

## Quick start

- Fork and clone this repository
- Run ```bundle``` in your terminal
- To run the tests, run ```rspec``` in your terminal. SimpleCov is included in these tests and will show a coverage percentage at bottom.
- To run the code linter, run ```rubocop``` in your terminal
- To run the program in IRB, run ```irb -r ./lib/account.rb``` in your terminal. This will require the account.rb file, which in turn will automatically require the statement.rb and transaction.rb files.

## Versioning
Ruby version 2.6.3.  
To change ruby versions run ```rvm install ruby-2.6.3``` in your terminal.

## My approach

1. Planning through [domain modelling](#domain-models) of required classes
2. Adhering to TDD processes:
  - Feature test to test the interaction between objects
  - Unit test to test the functionality of a class
  - Write the code to pass
  - Refactor where required
3. Run Rubocop before each commit to check code quality
4. Once the core of the program was complete, tackling edge cases repeating
the steps above  

Along with Rubocop, SimpleCov was utilised to ensure high code coverage, and
Travis CI as an extra safeguarding layer when pushing to GitHub.  

## Code structure

My code is structured into three classes - Account, Statement and Transaction. I started with the account class which I would use as the means for the user to interact with their account (i.e. deposit, withdraw or view statement). There would also need to be a centralised place to hold all transaction history for the account, so I created the statement class. Finally, I introduced the transaction class to connect the account and statement classes, allowing a new transaction to be created on the point of withdrawal or deposit and added to the statement.

As an edge case, I also considered if the user tried to withdraw an amount that exceeded their current balance. I introduced an error message to communicate this to the user. If an overdraft were to be required, I would introduce this by allowing a custom minus balance on initialisation of the account class.

## Features

```
2.6.3 :001 > require 'date'  
 => true  

2.6.3 :002 > my_account = Account.new   # create a new account  
 => #<Account:0x00007f92808ca478 @balance=0, @statement=#<Statement:0x00007f92808c9fc8 @transactions=[]>, @overdrawn_error="You do not have enough funds to withdraw this amount.">  

2.6.3 :003 > my_account.deposit(200)    # deposit funds into the account  
 => 200  

2.6.3 :004 > my_account.deposit(150)  
 => 350  

2.6.3 :005 > my_account.withdraw(130)   # withdraw funds from the account  
 => 220  

2.6.3 :006 > my_account.withdraw(250)   # cannot overdraw account; error will show  
 => "You do not have enough funds to withdraw this amount."  

2.6.3 :007 > puts my_account.statement    # print the account statement  
date || credit || debit || balance  
28/01/2020 || || 130.00 || 220.00  
28/01/2020 || 150.00 || || 350.00  
28/01/2020 || 200.00 || || 200.00  
 => nil  
```

## Domain models

| Account | Statement | Transaction |
| ------- | ------- | --------- |
| @balance | @transactions | @date |
| @statement | | @credit |
| @overdrawn_error | | @debit |
|        |       | @balance |
| -------- | -------- | -------- |
| .withdraw(amount) | .add(transaction) | |
| .deposit(amount) | .print | |
| .statement | | |

## Code style
- OOP
- TDD

## Tech used
- RSpec
- Ruby
- Rubocop
- SimpleCov
- Travis CI
- IRB

## Test coverage

### Feature tests

User can deposit and withdraw funds
- returns a balance of 5 after depositing 5 in the account
- returns a balance of 1 after 10 is deposited and 9 is withdrawn
- returns a correct balance after several account transactions

User can view their account statement
- shows an empty statement when account is brand new
- shows one transaction after first deposit into account
- shows two transactions after a deposit and then withdrawal
- shows multiple transactions after several deposits and withdrawals

User cannot breach 0 balance limit
- on first creation of account
  - shows an error message when user tries to overdraw on their account
- after the first deposit into account
  - shows an error message when user tries to overdraw on their account

### Unit tests

Account
- #deposit
  - increases the balance by 5 when 5 is deposited
- #withdraw
  - decreases the balance by 5 when 5 is withdrawn
  - shows an error message if trying to withdraw below the 0 balance limit
- #statement
  - shows an empty account statement on first creation of account

Statement
- #print
  - shows an empty account statement when there have been no transactions
  - shows one transaction when account has been deposited into for the first time
  - shows two transactions in reverse chronological order
  - shows multiple transactions in reverse chronological order
