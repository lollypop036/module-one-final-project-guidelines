class CuratorEditMenu

    attr_reader :curator

    def initialize(curator)
        @curator = curator
    end

    def run
        welcome_message
        while(true)
            command_list
            command = get_user_command
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
        puts "\nChange Name."
        puts "\nWhat would you like to change your name to?"
        name = gets.chomp
        curator.name = name
        curator.save
        if(curator.name == name)
            puts "The name change was successful."
        else
            puts "The name change failed."
        end
    end

    def change_username
        puts "\nChange Username."
        puts "\nWhat would you like to change your username to?"
        username = gets.chomp
        curator.username = username
        curator.save
        if(curator.username == username)
            puts "The username change was successful."
        else
            puts "The username change failed."
        end
    end

    def change_password
        puts "\nChange Password."
        puts "\nWhat would you like to change your password to?"
        password = gets.chomp
        curator.password = password
        curator.save
        if(curator.password == password)
            puts "The password change was successful."
        else
            puts "The password change failed."
        end
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

    def get_user_command
        puts "\nPlease enter a command number.(1-4)"
        gets.chomp
    end

end