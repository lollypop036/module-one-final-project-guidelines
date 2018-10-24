class ArtistViewExhibitionsMenu 


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
                list_exhibitions(artist.get_exhibitions)
            elsif(command == "2")
                list_exhibitions(artist.get_previous_exhibitions(today_date), "previous ")
            elsif(command == "3")
                list_exhibitions(artist.get_upcoming_exhibitions(today_date), "upcoming ")
            elsif(command == "4")
                break
            else
                puts "The number you entered did not relate to a command, try again."
            end
        end
            
    end



    def list_exhibitions(arr_exhibitions, state="")
        #binding.pry
        if(arr_exhibitions.length > 0)
            count = 1
            puts "\nYour #{state}exhibitions are;"
            arr_exhibitions.each do |e| 
                puts "#{count}. #{e.name}"
                puts "#{self.exhibition_visitor_count(e)} tickets sold"
                count += 1
            end 
        else
            puts "\nYou have no #{state}exhibitions on record."
        end
    end

    def welcome_message
        puts "\nWelcome to the view exhibitions menu."
    end

    def command_list
        puts "\n1. View all your exhibitions."
        puts "2. View previous exhibitions."
        puts "3. View upcoming exhibitions."
        puts "4. Return to main dashboard."
    end

    def get_user_command
        puts "\nPlease enter a command number.(1-4)"
        gets.chomp
    end

end

