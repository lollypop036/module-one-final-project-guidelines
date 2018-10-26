class CuratorDashboard

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
                edit_menu = CuratorEditMenu.new(curator)
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
                puts "Goodbye, Curator #{curator.name}"
                break
            else
                puts "The number you entered did not relate to a command, try again."
            end
        end
    end

    def welcome_message
        puts "Welcome Curator #{curator.name}."
    end

    def command_list
        puts "\nWhat would you like to do?"
        puts "\n1. Edit profile."
        puts "2. View your Exhibitions."
        puts "3. Create a new Exhibition."
        puts "4. Search Artists."
        puts "5. Search Curators."
        puts "6. Exhibitions Menu."
        puts "7. Sign Out."
    end

    def get_user_input
        puts "\nPlease enter a command number.(1-7)"
        gets.chomp
    end

end