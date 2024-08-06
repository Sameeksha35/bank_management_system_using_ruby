module AccountManagement
    def self.create_account(accounts, name, initial_balance)
      account_number = generate_account_number
      accounts[account_number] = BankAccount.new(name, initial_balance, account_number)
      account_number
    end
  
    def self.check_balance(account)
      account.balance
    end
  
    private
    def self.generate_account_number
      "ACCT#{rand(10000..99999)}"
    end

    def self.display_all_accounts(accounts)
      if accounts.empty?
        puts "\u{1F610} No account found."
      else
        puts "\n\u{1F464} List of All Account Holders:"
        puts "\n"
        puts "Account Number | Holder Name - Balance "
        puts "---------------------------------------"
        accounts.each do |account_number, account|
          puts "   #{account_number}   |    #{account.name} - #{account.balance}   " 
        end
      end
    end
end
  