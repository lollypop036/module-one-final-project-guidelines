class AddCollaboration

    attr_reader :exhibition_array

    def initialize(exhibition_array)
        @exhibition_array = exhibition_array
    end

    def run
        welcome_message
        while(true)
            command_list
            command = get_user_command
            if(command == "1")
                create_collaboration
            elsif(command == "2")
                break
            else
                puts "The number you entered did not relate to a command, try again.".colorize(:red)
            end
        end
    end

    def create_collaboration
        if exhibition_array.length > 1 
            puts "\nWhich exhibition would you like to create a collaboration for?".colorize(:light_blue)
            selected = gets.chomp
            exhibition_id = exhibition_array[selected.to_i - 1].id
            puts "\nWhich artist would you like to add?(enter a name)".colorize(:light_cyan)
            artist = Artist.search_by_name(gets.chomp)[0]
            Collaboration.create(artist_id: artist.id, exhibition_id: exhibition_id)
            puts "Collaboration creation was successful".colorize(:light_green)
        else
            puts "\nWhich artist would you like to add?(enter a name)".colorize(:white)
            artist = Artist.search_by_name(gets.chomp)
            Collaboration.create(artist_id: artist.id, exhibition_id: exhibition_array[0].id)
            puts "Collaboration creation was successful".colorize(:light_green)
        end
    end

    def welcome_message
        puts "\nWould you like to add a collaboration?".colorize(:white)
    end

    def command_list
        puts "1. Add collaboration.".colorize(:light_blue)
        puts "2. Quit to you exhibitions menu.".colorize(:light_cyan)
    end

    def get_user_command
        puts "\nPlease enter a command number.(1-2)".colorize(:white)
        gets.chomp
    end

end