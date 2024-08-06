require_relative 'account_management'
require_relative 'transaction_management'
require_relative 'user_interface'
require_relative 'bank_account'

accounts = {}

loop do
  UserInterface.display_menu
  option = gets.chomp
  UserInterface.handle_option(option, accounts)
end

