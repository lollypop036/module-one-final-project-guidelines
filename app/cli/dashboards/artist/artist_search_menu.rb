class ArtistSearchMenu


    attr_reader :artist

    def initialize(artist)
        @artist = artist
    end
    
    def run
        welcome_message
        while(true)
            command_list
            command = get_user_command
            today_date = Date.today
            if(command == "1")
                search_artists
            elsif(command == "2")
                search_curators
            elsif(command == "3")
                view_collaborations
            elsif(command == "4")
               find_exhibitions
            elsif(command == "5")
                break
            else
                puts "The number you entered did not relate to a command, try again."
            end
        end
    end
            
    

    def welcome_message
        puts "\ Discover people and build a network around the globe."
    end


    def command_list
        puts "\n1. Search artists"
        puts "2. Search curators"
        puts "3. Find collaborations"
        puts "4 Find exhbitions"
        puts "5. Quit to main dashboard."
    end

    def get_user_command
        puts "\nPlease enter a command number.(1-5)"
        gets.chomp
    end




    def search_artists
        puts "Please choose your search criteria from the options below:"
        puts "1. Name"
        puts "2. Location"
        puts "3. Style"

        search = gets.chomp
        
            case search
            when "1"
                puts "Enter name"
                search = gets.chomp
               result = Artist.search_by_name(search)
               
            when "2"
                puts "Enter location"
                search = gets.chomp
                result = Artist.search_by_location(search)
              
            when "3"
                puts "Enter style"
                search = gets.chomp
                result = Artist.search_by_style(search)
                
            else
                puts "Please enter a valid number"
            end
        
   
        if result != nil
            result.each do |x|  
                puts "#{result.name} - Upcoming Exhibitions" 
                puts x.get_exhibitions
            end
    else
        puts "No results"
    end
    end


    def search_curators
        puts "Please choose your search criteria from the options below:"
        puts "1. Name"
        puts "2. Location"

        search = gets.chomp
        
        case search
        when "1"
            puts "Enter name"
           search = gets.chomp
           result =  Curator.search_by_name(search)
            
        when "2"
            puts "Enter location"
            search = gets.chomp
            result = Curator.search_by_location(search)
            
        when "3"
            puts "Enter style"
            search = gets.chomp
            result = Curator.search_by_style(search)
           
        else
           puts  "Please enter a valid number"
        end
    

        if result != nil
            result.each do |x|  
                puts "#{result.name} - Upcoming Exhibitions" 
                puts x.get_exhibitions
            end
        else
            puts "No results"
        end
    
    
    end
    
    def view_collaborations
        puts "type 1 to view all collaborations or 2 to search by artist"
        command = gets.chomp
        if command == "1"
            puts Collaboration.all

        else puts "Enter a name"
            search = gets.chomp
            Collaboration.find_by_artist_name(search)
            Collaboration.search_exhibitions_by_artist(search)
        end
    end



    def find_exhibitions
        puts "type 1 to view all exhibitions or 2 to perform a search"
        command = gets.chomp
        if command == "1"
            puts Exhibition.all.map{|x| "#{x.location}, #{x.name}, #{x.date}"}
            puts "Would you like to book an exhibition? Y/N"
            answer = gets.chomp
            make_booking if answer == "Y" || answer == "y"
             
        else
            
            puts "Please choose your search criteria from the options below:"
            puts "1. Name"
            puts "2. Location"
            puts "3. Artist"
            puts "4. Style"

            search = gets.chomp
        
        case search
        when "1"
            puts "Enter name"
           search = gets.chomp
           result =  Exhibition.all.where("name == ?", search)
            
        when "2"
            puts "Enter location"
            search = gets.chomp
            result = Exhibition.search_by_location(search)
            
        when "3"
            puts "Enter artist"
            search = gets.chomp
            Exhibition.search_by_artist(search)

        when "4"
            puts "Enter style"
            search = gets.chomp
            Exhibition.search_by_style(search)
           
        else
           puts  "Please enter a valid number"
        end
    

        if result != nil
            result.each do |x|  
                puts "#{result.name} - Details" 
                puts "Date: #{x.date}"
                puts "Location: #{x.location}"
                puts "Style: #{x.style}"
            end
            puts "Would you like to book an exhibition? Y/N"
            answer = gets.chomp
            make_booking if answer == "Y" || answer == "y"
             
        else
            puts "No results"
        end
    
    
    end
    end
    
    def make_booking
       puts "Please enter an exhibition name exactly as listed"
            answer = gets.chomp
            booking = Exhibition.all.find_by("name == ?", answer)
            artist.make_exhibition_booking(booking)
    end

end

