class GuestDashboard

    def run
        welcome_message
        while(true)
            list_commands
            command = get_user_command
            if(command == "1")
            elsif(command == "2")
            elsif(command == "2")
            elsif(command == "2")
            else
            end
        end
    end

    def welcome_message
        puts "Welcome Guest"
    end

    def list_commands
        puts "\n1. Exhibitions Menu."
        puts "2. Artist search Menu."
        puts "3. Curator search Menu."
        puts "4. Sign Out."
    end

    def get_user_command
        puts "\nPlease enter a command number.(1-4)"
        gets.chomp
    end

end