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
            end
        end
    end

    def welcome_message
        puts "Welcome, Artist #{artist.name}!".colorize(:light_blue)
    end

    def command_list
        array = ["Edit profile.", "View your Exhibitions.", "Create a new Exhibition.", "Explore", "Sign Out."]
        prompt.select("\nWhat would you like to do?", array)
    end

end
