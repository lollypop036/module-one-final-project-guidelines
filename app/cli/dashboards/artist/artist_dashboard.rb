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
                edit_menu = ArtistEditMenu.new(artist)
                edit_menu.run
            elsif(command == "2")
                #view exhibitions
            elsif(command == "3")
             #create exhibition
            elsif(command == "4")
                #search artists
            elsif(command == "4")
                #search curators
            elsif(command == "6")
                #search collabs
            elsif(command == "7")
                puts "Goodbye, Artist #{artist.name}"
                break
            else
                puts "The number you entered did not relate to a command, try again."
            end
        end
    end

    def welcome_message
        puts "Welcome Artist #{artist.name}."
    end

    def command_list
        puts "\nWhat would you like to do?"
        puts "\n1. Edit profile."
        puts "2. View your Exhibitions."
        puts "3. Create a new Exhibition."
        puts "4. Search Artists."
        puts "5. Search Curators."
        puts "6. Search Collaborations."
        puts "7. Sign Out."
    end

    def get_user_input
        puts "\nPlease enter a command number.(1-6)"
        gets.chomp
    end

end
