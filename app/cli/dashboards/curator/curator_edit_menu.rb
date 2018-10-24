class CuratorEditMenu

    attr_reader :curator

    def initialize(curator)
        @curator = curator
    end

    def run
        welcome_message
        while(true)
            command_list
            command = get_user_input
            if(command == "1")
                change_name
            elsif(command == "2")
                change_username
            elsif(command == "3")
                change_password
            elsif(command == "4")
                break
            else
                puts "The number you entered did not relate to a command, try again."
            end
        end

    end

    def change_name
        puts "\nChange Name"

    end

    def change_username
    end

    def change_password
    end

    def welcome_message
        puts "\nWelcome to the Edit menu."
    end

    def command_list
        puts "\n1. Change name."
        puts "2. Change Username."
        puts "3. Change Password."
        puts "4. Quit to main dashboard."
    end

    def get_user_input
        puts "\nPlease enter a command number.(1-4)"
        gets.chomp
    end

end