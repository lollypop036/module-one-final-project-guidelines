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
            
            if(command == "1")
                list_exhibitions(artist.get_exhibitions)
            elsif(command == "2")
                list_exhibitions(artist.get_previous_exhibitions, "previous ")
            elsif(command == "3")
                list_exhibitions(artist.get_upcoming_exhibitions, "upcoming ")
            elsif(command == "4")
                artist_bookings
            elsif(command == "5")
                break
            else
                puts "The number you entered did not relate to a command, try again."
            end
        end
            
    end



    def list_exhibitions(arr_exhibitions, state="")
        #binding.pry
        while(true)
            if(arr_exhibitions.length > 0)
                
                puts "\n#{state.capitalize} Exhibitions"
                arr_exhibitions.each do |e| 
                    puts "#{arr_exhibitions.index(e)+1}. #{e.name} - #{e.date}, #{e.location}"
                    puts "#{artist.exhibition_visitor_count(e)} tickets sold"
                    
                end
            
                puts "To view attendees, please enter the name of the exhibition, else press zero to quit"
        
                command = gets.chomp

                #  while(true)
                    if command == "0"
                        break
                    elsif Exhibition.search_by_name(command).length != 0
                        exhibition = Exhibition.search_by_name(command)[0]
                        if Booking.all.where("exhibition_id == ?", exhibition.id).length > 0
                            exhibition.view_attendees
                            break
                        else 
                            puts "No attendees"
                            break
                        end
                    else
                        puts "Invalid response."
                        
                    end
                    
                #  end
                
            else
                puts "\nYou have no #{state}exhibitions on record."
                break
            end
        end
    end


    
    def welcome_message
        puts "\nWelcome to the view exhibitions menu."
    end


    def command_list
        puts "\n1. View all your exhibitions."
        puts "2. View previous exhibitions."
        puts "3. View upcoming exhibitions."
        puts "4. View your exhibition bookings"
        puts "4. Return to main dashboard."
    end

    
    def get_user_command
        puts "\nPlease enter a command number.(1-4)"
        gets.chomp
    end

end