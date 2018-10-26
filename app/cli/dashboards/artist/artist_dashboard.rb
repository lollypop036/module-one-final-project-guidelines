class ArtistDashboard 

    attr_reader :artist

    def initialize(artist)
        @artist = artist
    end

    def run
        welcome_message
        while(true)
            command_list
            command = get_user_input
            if(command == "1")
                #edit profile
                edit_menu = ArtistEditMenu.new(artist)
                edit_menu.run
            elsif(command == "2")
                #view own exhibitions
                view_menu = ArtistViewExhibitionsMenu.new(artist)
                view_menu.run
            elsif(command == "3")
                #create exhibition
                create_menu = CreateMenu.new(artist)
                create_menu.run
            elsif(command == "4")
           #search curators & artists
                search = ArtistSearchMenu.new
                search.run
            elsif(command == "5")
                puts "Goodbye, Artist #{artist.name}"
                break
            else
                puts "The number you entered did not relate to a command, try again.".colorize(:red)
            end
        end
    end

    def welcome_message
        puts "Welcome, Artist #{artist.name}!".colorize(:light_blue)
    end

    def command_list
        puts "\nWhat would you like to do?".colorize(:white)
        puts "\n1. Edit profile.".colorize(:light_blue)
        puts "2. View your Exhibitions.".colorize(:light_cyan)
        puts "3. Create a new Exhibition.".colorize(:light_blue)
        puts "4. Explore".colorize(:light_cyan)
        puts "5. Sign Out.".colorize(:light_blue)
    end

    def get_user_input
        puts "\nPlease enter a command number (1-5) to proceed.".colorize(:white)
        gets.chomp
    end

end
