class Interface

    def run
        prompt = TTY::Prompt.new
        welcome_message
        while(true)
            array = ["Sign-in.", "Create account.", "Continue as guest.", "Quit."]
            command = prompt.select("\nWhat would you like to do?", array)
            if(command == "Sign-in.")
                login = Login.new(prompt)
                login.run
            elsif(command == "Create account.")
                account = AccountDashboard.new(prompt)
                account.run
            elsif(command == "Continue as guest.")
                guest_dashboard = GuestDashboard.new
                guest_dashboard.run
            elsif(command == "Quit.")
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