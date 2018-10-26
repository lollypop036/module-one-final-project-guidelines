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
                puts "The number you entered did not relate to a command, try again."
            end
        end
    end

    def welcome_message
        puts "\nWelcome Guest"
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