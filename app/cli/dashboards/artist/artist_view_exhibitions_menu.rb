class ArtistViewExhibitionsMenu 


    attr_reader :artist

    def initialize(artist)
        @artist = curator
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
                list_exhibitions(arist.get_previous_exhibitions(today_date), "previous ")
            elsif(command == "3")
                list_exhibitions(artist.get_upcoming_exhibitions(today_date), "upcoming ")
            elsif(command == "4")
                break
            else
                puts "The number you entered did not relate to a command, try again."
            end
        end
            
    end
end
