class Interface

    def run
        prompt = TTY::Prompt.new(active_color: :bright_cyan)
        welcome_message
        while(true)
            array = ["Sign-in.", "Create account.", "Continue as guest.", "Quit."]
            command = prompt.select("\nWhat would you like to do?".colorize(:white), array)
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
                puts "\nThank you, Good-bye!".colorize(:light_cyan)
                break
            else
                puts "Invalid command.".colorize(:red)
            end
        end
    end

    def welcome_message
        puts "Welcome to Art Goes Out To!".colorize(:white)
    end

end