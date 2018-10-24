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
                #edit profile
            elsif(command == "2")
                #view exhibitions
            elsif(command == "3")
                #create exhibition
            elsif(command == "4")
                #search artists
            elsif(command == "5")
                #search collabs
            elsif(command == "6")
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
        puts "5. Search Collaborations."
        puts "6. Sign Out."
    end

    def get_user_input
        puts "\nPlease enter a command number.(1-6)"
        gets.chomp
    end

end