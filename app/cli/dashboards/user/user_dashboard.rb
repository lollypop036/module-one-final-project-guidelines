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
                edit_menu = UserEditMenu.new(user)
                edit_menu.run
            elsif(command == "2")
                exhibition_menu = ExhibitionMenu.new(user)
                exhibition_menu.run
            elsif(command == "3")
                break
            elsif(command == "4")
                break
            elsif(command == "5")
                view_booking_menu = ViewBookingMenu.new(user)
                view_booking_menu.run
            elsif(command == "6")
                break
            else
                puts "The number you entered did not relate to a command, try again."
            end
        end
    end

    def welcome_message
        puts "Welcome User #{user.name}"
    end

    def command_list
        puts "\n1. Edit Profile."
        puts "2. Exhibitions Menu."
        puts "3. Artist search Menu."
        puts "4. Curator search Menu."
        puts "5. View Bookings."
        puts "6. Sign Out."
    end

    def get_user_command
        puts "\nPlease enter a command number.(1-5)"
        gets.chomp
    end

end