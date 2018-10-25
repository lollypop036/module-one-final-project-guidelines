class ArtistCreateMenu


    attr_reader :artist

    def initialize(artist)
        @artist = artist
    end

    def run
        welcome_message
        while(true)
            command_list
            command = get_user_command
            if(command == "1")
                create_exhibition
                break
            elsif(command == "2")
                break
            else
                puts "The number you entered did not relate to a command, try again."
            end
        end
    end

    def create_exhibition
        puts "\nWhat is the title?"
        title = gets.chomp
        puts "What is the date?(dd/mm/yyyy)"
        date = gets.chomp
        puts "What is the location?"
        location = gets.chomp
        puts "What is the time?"
        time = gets.chomp
        exhibition = artist.create_exhibition(title, date, location, time)
        puts "\nYou have created an exhibition, details below:"
        puts "title: #{exhibition.name}, date: #{exhibition.date}, location: #{exhibition.location}, time: #{exhibition.time}"
    end

    def welcome_message
        puts "\nWelcome to the create Exhibition Menu."
    end

    def get_user_command
        puts "\nPlease enter a command number.(1-6)"
        gets.chomp
    end

    def command_list
        puts "\n1. Create new Exhibition."
        puts "2. Quit to main dashboard."
    end

end
