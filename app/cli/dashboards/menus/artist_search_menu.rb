class ArtistSearchMenu


    def run
        while(true)
            command_list
            command = get_user_command
            if command == "1"
            search_artists
            elsif command == "2"
                break
            else
                puts "The number you entered did not relate to a command, try again.".colorize(:red)
            end
        end
    end


    def get_user_command
        puts "\nPlease enter a command number.(1-2)".colorize(:white)
        gets.chomp
    end

    def command_list
        puts "\n1. Search artists".colorize(:light_blue)
        puts "2. Go back".colorize(:light_cyan)
    end

    def search_artists
      
        while(true)

            puts "\nPlease choose your search criteria from the options below:".colorize(:white)

            puts "1. Name".colorize(:light_blue)
            puts "2. Location".colorize(:light_cyan)
            puts "3. Style".colorize(:light_blue)
            search = gets.chomp

            case search


                when "1"
                    puts "\nEnter name".colorize(:white)
                    search = gets.chomp
                    list_artists(Artist.search_by_name(search))
                    break
                when "2"
                    puts "\nEnter location".colorize(:white)
                    search = gets.chomp
                    list_artists(Artist.search_by_location(search))
                    break
                when "3"
                    puts "\nEnter style".colorize(:white)
                    search = gets.chomp
                    list_artists(Artist.search_by_style(search))

                    break
                else
                "Please enter a valid number".colorize(:red)
            end
        end
     end


     def list_artists(artists)
        if artists.length > 0
            count = 1
            artists.each do |x|  
                puts "\nArtist #{count}.".colorize(:white)
                puts "------------------------".colorize(:white)
                puts "Name: #{x.name}".colorize(:light_blue)
                puts "Location: #{x.location}".colorize(:light_cyan)
                puts "Style: #{x.style}".colorize(:light_blue)
                count += 1
            end
        else
            puts "\nNo artists were found.".colorize(:red)
        end
     end

end