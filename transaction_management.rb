module TransactionManagement
    def self.deposit(account,amount)
      if amount > 0
        account.balance += amount
        account.add_transaction("Deposit", amount)
        puts "\u{1F4B5} Deposited $#{amount}. New balance: $#{account.balance}."
      else
        puts "\u{274C} Invalid deposit amount."
      end
    end
  
    def self.withdraw(account, amount)
      if amount > 0 && amount <= account.balance
        account.balance -= amount
        account.add_transaction("Withdrawal", amount)
        puts "\u{1F4B8} Withdrawal $#{amount}. New balance: $#{account.balance}."
      else
        puts "\u{274C} Invalid or insufficient funds for withdrawal."
      end
    end

    def self.view_transactions(account)
      if account.transactions.empty?
        puts "\u{1F4C5} No transactions found for account #{account.account_number}."
      else
        puts "\n\u{1F4C4} Transaction History for account #{account.account_number}:"
        puts "\n"
        puts "          Date         |   Description / Amount         "
        puts "--------------------------------------------------------"
        account.transactions.each do |transaction|
          puts "  #{transaction[:date]}  |    #{transaction[:description]}  /   #{transaction[:amount]}"
        end
      end
    end

  end
  