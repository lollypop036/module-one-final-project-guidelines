class GuestDashboard

    def run
        welcome_message
        while(true)
            list_commands
            command = get_user_command
            if(command == "1")
                exhibition_menu = ExhibitionMenu.new
                exhibition_menu.run
            elsif(command == "2")
                artist_menu = ArtistSearchMenu.new
                artist_menu.run
            elsif(command == "3")
                curator_menu = CuratorSearchMenu.new
                curator_menu.run
            elsif(command == "4")
                break
            else
                puts "The number you entered did not relate to a command, try again.".colorize(:red)
            end
        end
    end

    def welcome_message
        puts "\nWelcome Guest".colorize(:light_blue)
    end

    def list_commands
        puts "\n1. Exhibitions Menu.".colorize(:light_cyan)
        puts "2. Artist search Menu.".colorize(:light_blue)
        puts "3. Curator search Menu.".colorize(:light_cyan)
        puts "4. Sign Out.".colorize(:red)
    end

    def get_user_command
        puts "\nPlease enter a command number.(1-4)".colorize(:white)
        gets.chomp
    end

end