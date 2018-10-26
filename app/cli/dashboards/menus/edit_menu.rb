class EditMenu

    attr_reader :user, :prompt

    def initialize(user, prompt)
        @user = user
        @prompt = prompt
    end

    def run
        while(true)
            #command_list
            command = command_list
            if(command == "Change name.")
                change_name
            elsif(command == "Change Username.")
                change_username
            elsif(command == "Change Password.")
                change_password
            elsif(command == "Change Location.")
                change_location
            elsif(command == "Quit to main dashboard.")
                break
<<<<<<< HEAD
            else
                puts "The number you entered did not relate to a command, try again.".colorize(:red)
=======
>>>>>>> 025b9483d587e28ef8a5498b924af1b6ffd43ca6
            end
        end

    end

    def change_name
<<<<<<< HEAD
        puts "\nChange Name.".colorize(:white)
        puts "\nWhat would you like to change your name to?".colorize(:white)
        name = gets.chomp
=======
        puts "\nChange Name."
        name = prompt.ask("What would you like to change your name to?")
>>>>>>> 025b9483d587e28ef8a5498b924af1b6ffd43ca6
        user.update(:name => name)
        if(user.name == name)
            puts "The name change was successful.".colorize(:green)
        else
            puts "The name change failed.".colorize(:red)
        end
    end

    def change_username
        puts "\nChange Username."
        username = prompt.ask("What would you like to change your username to?")
        user.update(:username => username)
        if(user.username == username)
            puts "The username change was successful.".colorize(:green)
        else
            puts "The username change failed.".colorize(:red)
        end
    end

    def change_password
        puts "\nChange Password.".colorize(:light_cyan)
        password = prompt.ask("What would you like to change your password to?").colorize(:white)
        user.update(:password => password)
        if(user.password == password)
            puts "The password change was successful."
        else
            puts "The password change failed."
        end
    end

    def change_location
        puts "\nChange Location."
        location = prompt.ask("What would you like to change your location to?")
        user.update(:location => location)
        if(user.location == location)
            puts "The password change was successful."
        else
            puts "The password change failed."
        end
    end

    def command_list
        array = ["Change name.", "Change Username.", "Change Password.", "Change Location.", "Quit to main dashboard."]
        command = prompt.select("\nWelcome to the Edit menu.", array)
    end

end