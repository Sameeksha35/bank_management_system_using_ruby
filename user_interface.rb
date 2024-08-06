module UserInterface
    def self.display_menu
      puts "\n\u{1F31F}--------- Welcome to the Bank Management System -----------\u{1F31F}"
      puts "\n1. \u{1F195} Create a New Account"
      puts "2. \u{1F4B0} Check Account Balance"
      puts "3. \u{1F4B5} Deposit Funds"
      puts "4. \u{1F4B8} Withdraw Funds"
      puts "5. \u{1F465} Account Holders"
      puts "6. \u{1F4C4} View Transactions"
      puts "7. \u{1F6AA} Exit"
      print "\nPlease choose an option: "
    end
  
    def self.handle_option(option, accounts)
      case option
      when '1'
        print "\u{1F464} Enter account holder's name: "
        name = gets.chomp
        if (name.match?(/[A-Za-z]$/)) != true
            puts "\u{270D} Please enter a valid holder name using only letters."
            display_menu
            option = gets.chomp
            handle_option(option, accounts)
        else
            print "\u{1F4B5} Enter initial deposit amount: "
            initial_balance = gets.to_f
            account_number = AccountManagement.create_account(accounts, name, initial_balance)
            puts "\u{2705} Account created successfully. Your account number is #{account_number}."
        end
      when '2'
        print "\u{1F50D} Enter account number: "
        account_number = gets.chomp
        account = accounts[account_number]
        back = ""
        flag = false
        while(back != "back" and flag != true)
            if account
                puts "\u{1F4B3} Balance for account #{account_number}: $#{AccountManagement.check_balance(account)}"
                flag = true
            else
                puts "\u{274C} Account not found. Please check the account number and try again."
                print "\u{1F50D} Enter account number or type \"back\" to go back : "
                account_number = gets.chomp
                if(account_number == "back")
                    back = "back"
                else
                account = accounts[account_number]
                end
            end
        end
      when '3'
        print "\u{1F50D} Enter account number: "
        account_number = gets.chomp
        account = accounts[account_number]
        if account
          print "\u{1F4B5} Enter deposit amount: "
          amount = gets.chomp.to_f
          TransactionManagement.deposit(account,amount)
        else
          puts "\u{274C} Account not found."
        end
      when '4'
        print "\u{1F50D} Enter account number: "
        account_number = gets.chomp
        account = accounts[account_number]
        if account
          print "\u{1F4B8} Enter withdrawal amount: "
          amount = gets.to_f
          TransactionManagement.withdraw(account, amount)
        else
          puts "\u{274C} Account not found."
        end
      when '5'
        AccountManagement.display_all_accounts(accounts)
      when '6'
        print "\u{1F50D} Enter account number to view transactions: "
        account_number = gets.chomp
        account = accounts[account_number]
        if account
          TransactionManagement.view_transactions(account)
        else
          puts "\u{274C} Account not found."
        end
      when '7'
        puts "\n\u{1F44B} Thank you for your visiting.Have a great day! \u{1F31F}"
        exit
      else
        puts "\u{274C} Invalid option. Please enter a number between 1 and 6."
      end
    end
  end
  