class Interface

    def run
        welcome_message
        while(true)
            puts "\nWhat would you like to do? (sign-in - s, create-account - a, continue-as-guest - g or quit - q)"
            command = gets.chomp
            if(command == "s")
                login = Login.new
                login.run
            elsif(command == "a")
                account = AccountDashboard.new
                account.run
            elsif(command == "g")
                guest_dashboard = GuestDashboard.new
                guest_dashboard.run
            elsif(command == "q")
                puts "\nThank you, Good-bye!"
                break
            else
                puts "Invalid command."
            end
        end
    end

    def welcome_message
        puts "Welcome to Art World!"
    end

end