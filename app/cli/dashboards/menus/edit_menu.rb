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
            end
        end

    end

    def change_name
        puts "\nChange Name.".colorize(:light_blue)
        name = prompt.ask("What would you like to change your name to?")
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
            puts "The password change was successful.".colorize(:green)
        else
            puts "The password change failed.".colorize(:red)
        end
    end

    def change_location
        puts "\nChange Location.".colorize(:light_cyan)
        location = prompt.ask("What would you like to change your location to?").colorize(:white)
        user.update(:location => location)
        if(user.location == location)
            puts "The password change was successful.".colorize(:green)
        else
            puts "The password change failed.".colorize(:red)
        end
    end

    def command_list
        array = ["Change name.", "Change Username.", "Change Password.", "Change Location.", "Quit to main dashboard."]
        command = prompt.select("\nWelcome to the Edit menu.", array)
    end

end