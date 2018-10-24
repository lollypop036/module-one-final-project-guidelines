class UserExhibitionSearchMenu

    attr_reader :user

    def initialize(user)
        @user = user
    end

    def run
        welcome_message
        while(true)
            command_list
            command = get_user_command
            if(command == "1")
            elsif(command == "2")
            elsif(command == "2")
            elsif(command == "2")
            elsif(command == "2")
            elsif(command == "2")
            else
                puts "The number you entered did not relate to a command, try again."
            end
        end
    end

    def welcome_message
        puts "\nWelcome to the Search Exhibition Menu."
    end

    def command_list
        puts "\n1. Search Exhibitions by name."
        puts "2. Search Exhibitions by Artist."
        puts "3. Search Exhibitions by Style."
        puts "4. Search Exhibitions by Curator."
        puts "5. Search Exhibitions by Location."
        puts "6. Quit to main dashboard."
    end

    def get_user_command
        puts "\nPlease enter a command number.(1-3)"
        gets.chomp
    end

end