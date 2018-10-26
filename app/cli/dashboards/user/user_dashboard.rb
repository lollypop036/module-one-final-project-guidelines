class UserDashboard

    attr_reader :user, :prompt

    def initialize(user, prompt)
        @user = user 
        @prompt = prompt
    end

    def run
        welcome_message
        while(true)
            command_list
            command = get_user_command
            if(command == "1")
                edit_menu = UserEditMenu.new(user, prompt)
                edit_menu.run
            elsif(command == "2")
                exhibition_menu = ExhibitionMenu.new(user)
                exhibition_menu.run
            elsif(command == "3")
                artist_menu = ArtistSearchMenu.new
                artist_menu.run
            elsif(command == "4")
                curator_menu = CuratorSearchMenu.new
                curator_menu.run
            elsif(command == "5")
                view_booking_menu = ViewBookingMenu.new(user, prompt)
                view_booking_menu.run
            elsif(command == "6")
                puts "Goodbye, User #{user.name}".colorize(:white)
                break
            else
                puts "The number you entered did not relate to a command, try again.".colorize(:lred)
            end
        end
    end

    def welcome_message
        puts "\nWelcome User #{user.name}".colorize(:white)
    end

    def command_list
        puts "\n1. Edit Profile.".colorize(:light_cyan)
        puts "2. Exhibitions Menu.".colorize(:light_blue)
        puts "3. Artist search Menu.".colorize(:light_cyan)
        puts "4. Curator search Menu.".colorize(:light_blue)
        puts "5. View Bookings.".colorize(:light_cyan)
        puts "6. Sign Out.".colorize(:light_blue)
    end

    def get_user_command
        puts "\nPlease enter a command number.(1-6)".colorize(:white)
        gets.chomp
    end

end