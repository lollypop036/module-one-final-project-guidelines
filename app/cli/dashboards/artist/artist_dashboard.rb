class ArtistDashboard 

    attr_reader :artist, :prompt

    def initialize(artist, prompt)
        @artist = artist
        @prompt = prompt
    end

    def run
        welcome_message
        while(true)
            command = command_list
            if(command == "Edit profile.")
                edit_menu = ArtistEditMenu.new(artist, prompt)
                edit_menu.run
            elsif(command == "View your Exhibitions.")
                view_menu = ArtistViewExhibitionsMenu.new(artist, prompt)
                view_menu.run
            elsif(command == "Create a new Exhibition.")
                #create exhibition
                create_menu = CreateMenu.new(artist)
                create_menu.run
            elsif(command == "Explore")
           #search curators & artists
                search = ArtistSearchMenu.new
                search.run
            elsif(command == "Sign Out.")
                puts "Goodbye, Artist #{artist.name}"
                break
<<<<<<< HEAD
            else
                puts "The number you entered did not relate to a command, try again.".colorize(:red)
=======
>>>>>>> 025b9483d587e28ef8a5498b924af1b6ffd43ca6
            end
        end
    end

    def welcome_message
        puts "Welcome, Artist #{artist.name}!".colorize(:light_blue)
    end

    def command_list
<<<<<<< HEAD
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
=======
        array = ["Edit profile.", "View your Exhibitions.", "Create a new Exhibition.", "Explore", "Sign Out."]
        prompt.select("\nWhat would you like to do?", array)
>>>>>>> 025b9483d587e28ef8a5498b924af1b6ffd43ca6
    end

end
