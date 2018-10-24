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
                #find collabs
            elsif(command == "4")
               #find exhibitions
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
                "Please enter a valid number"
            end
        
   
        if result != nil
        result.each do |x|  
            puts "#{result.name} - Upcoming Exhibitions" 
            puts x.get_upcoming_exhibitions(Date.today)
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
            "Please enter a valid number"
        end
    

        if result != nil
            result.each do |x|  
                puts "#{result.name} - Upcoming Exhibitions" 
                puts x.get_upcoming_exhibitions
            end
        else
            puts "No results"
        end
    
    
    end
    


    
end

