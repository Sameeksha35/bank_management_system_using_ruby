
  class BankAccount
    attr_accessor :name, :balance, :account_number, :transactions
  
    def initialize(name, balance, account_number)
      @name = name
      @balance = balance
      @account_number = account_number
      @transactions = []
    end
  
    def add_transaction(description, amount)
      @transactions << { description: description, amount: amount, date: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
    end
  end
  