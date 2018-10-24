class UserDashboard

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
                #break
            elsif(commad == "2")
                #break
            elsif(commad == "3")
                #break
            elsif(commad == "4")
                #break
            elsif(commad == "5")
                break
            else
                puts "The number you entered did not relate to a command, try again."
            end
        end
    end

    def welcome_message
        puts "Welcome User #{user.first_name} #{user.last_name}."
    end

    def command_list
        puts "\n1. View Exhibitions."
        puts "2. Search Exhibitions."
        puts "3. Make a Booking."
        puts "4. Search Collaborations"
        puts "5. Sign Out."
    end

    def get_user_command
        puts "\nPlease enter a command number.(1-5)"
        gets.chomp
    end

end