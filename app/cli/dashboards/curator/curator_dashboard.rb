class CuratorDashboard

    attr_reader :curator, :prompt

    def initialize(curator, prompt)
        @curator = curator
        @prompt = prompt
    end

    def run
        welcome_message
        while(true)
            command_list
            command = get_user_input
            if(command == "1")
                edit_menu = CuratorEditMenu.new(curator, prompt)
                edit_menu.run
            elsif(command == "2")
                view_menu = CuratorViewExhibitions.new(curator)
                view_menu.run
            elsif(command == "3")
                create_menu = CreateMenu.new(curator)
                create_menu.run
            elsif(command == "4")
                artist_menu = ArtistSearchMenu.new
                artist_menu.run
            elsif(command == "5")
                curator_menu = CuratorSearchMenu.new
                curator_menu.run
            elsif(command == "6")
                exhibition_menu = ExhibitionMenu.new(curator)
                exhibition_menu.run
            elsif(command == "7")
                puts "Goodbye, Curator #{curator.name}".colorize(:light_blue)
                break
            else
                puts "The number you entered did not relate to a command, try again.".colorize(:red)
            end
        end
    end

    def welcome_message
        puts "\nWelcome Curator #{curator.name}.".colorize(:light_blue)
    end

    def command_list
        puts "\nWhat would you like to do?".colorize(:white)
        puts "\n1. Edit profile.".colorize(:light_blue)
        puts "2. View your Exhibitions.".colorize(:light_cyan)
        puts "3. Create a new Exhibition.".colorize(:light_blue)
        puts "4. Search Artists.".colorize(:light_cyan)
        puts "5. Search Curators.".colorize(:light_blue)
        puts "6. Exhibitions Menu.".colorize(:light_cyan)
        puts "7. Sign Out.".colorize(:light_blue)
    end

    def get_user_input
        puts "\nPlease enter a command number.(1-7)".colorize(:white)
        gets.chomp
    end

end