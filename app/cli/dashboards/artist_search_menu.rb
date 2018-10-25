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
                puts "The number you entered did not relate to a command, try again."
            end
        end
    end


    def get_user_command
        puts "\nPlease enter a command number.(1-2)"
        gets.chomp
    end

    def command_list
        puts "\n1. Search artists"
        puts "2. Go back"
    end

    def search_artists
      
        while(true)
            puts "\nPlease choose your search criteria from the options below:"
            puts "1. Name"
            puts "2. Location"
            puts "3. Style"
            search = gets.chomp

            case search
                when "1"
                    puts "\nEnter name"
                    search = gets.chomp
                    list_artists(Artist.search_by_name(search))
                    break
                when "2"
                    puts "\nEnter location"
                    search = gets.chomp
                    list_artists(Artist.search_by_location(search))
                    break
                when "3"
                    puts "\nEnter style"
                    search = gets.chomp
                    list_artists(Artist.search_by_style(search))
                    break
                else
                "Please enter a valid number"
            end
        end
     end

     def list_artists(artists)
        if artists.length > 0
            count = 1
            artists.each do |x|  
                puts "\nArtist #{count}."
                puts "------------------------"
                puts "Name: #{x.name}"
                puts "Location: #{x.location}"
                puts "Style: #{x.style}"
                count += 1
            end
        else
            puts "\nNo artists were found."
        end
     end
end