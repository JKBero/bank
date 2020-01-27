# Bank

[Quick start](#quick-start) | [My approach to solving the challenge](#my-approach-to-solving-the-challenge) |
[Features](#features) | [Domain models](#domain-models) | [Code style](#code-style) |
[Tech used](#tech-used) | [Tech coverage](#tech-coverage) | [Versioning](#versioning)

This software imitates a bank account, allowing the user to withdraw and deposit
funds and read their bank statement.

## Quick start

- Fork and clone this repository
- Run ```bundle install``` in your terminal
- This programme is used in the terminal: Require files "account.rb",
"balance.rb" and "statement.rb" in IRB
- To run the tests, run ```rspec``` in your terminal

## My approach to solving the challenge

1. Planning through domain modelling of required classes
2. Adhering to TDD processes:
  - Feature test to test the interaction between objects
  - Unit test to test the functionality of a class
  - Write the code to pass
  - Refactor where required
3. Run Rubocop before each commit to check code quality
4. Once the core of the programme was complete, tackling edge cases repeating
the steps above

## Features

```

```

## Domain models

| Account | Balance | Statement | Transaction |
| ------- | ------- | --------- | ----------- |
| @balance | @total | @transactions | @transaction
| @statement | @statement | | |
| -------- | -------- | -------- | -------- |
| .withdraw(amount) | .credit(amount) | .new_transaction(amount, type, transaction_class) | |
| .deposit(amount) | .debit(amount) | .print | |
| .balance | .total | | |
| .statement | | | |   

## Code style
- OOP
- TDD

## Tech used
- RSpec
- Ruby
- IRB
- Rubocop
- SimpleCov
- Travis CI

## Test coverage

### Feature tests


### Unit tests

## Versioning
Ruby version 2.6.3.  
To change ruby versions run ```rvm install ruby-2.6.3``` in your terminal.
