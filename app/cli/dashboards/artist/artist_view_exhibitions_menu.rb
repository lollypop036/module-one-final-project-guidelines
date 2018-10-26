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
                list_exhibitions(Exhibition.joins(:collaborations, :artists).where("artists.id = ?", 1).distinct)
            elsif(command == "5")
                artist_bookings = ViewBookingMenu.new(artist)
                artist_bookings.run
            elsif(command == "6")
                break
            else
                puts "The number you entered did not relate to a command, try again.".colorize(:red)
            end
        end
            
    end



    def list_exhibitions(arr_exhibitions, state="")
        
        while(true)
            if(arr_exhibitions.length > 0)

                
                puts "\n#{state.capitalize} Exhibitions".colorize(:white)
                arr_exhibitions.each do |e| 
                    puts "#{arr_exhibitions.index(e)+1}. #{e.name} - #{e.date}, #{e.location}".colorize(light_blue)
                    puts "#{artist.exhibition_visitor_count(e)} tickets sold".colorize(:light_cyan)
                    
                end
            
                puts "To view attendees, please enter the name of the exhibition, else press zero to quit".colorize(:white)
        
                command = gets.chomp

             
                    if command == "0"
                        break
                    elsif Exhibition.search_by_name(command).length != 0
                        exhibition = Exhibition.search_by_name(command)[0]
                        if Booking.all.where("exhibition_id == ?", exhibition.id).length > 0
                            exhibition.view_attendees
                            break
                        else 
                            puts "No attendees".colorize(:light_cyan)
                            break
                        end
                    else
                        puts "Invalid response.".colorize(:red)
                        
                    end
                    
                
            else
                puts "\nYou have no #{state}exhibitions on record.".colorize(:white)
                break
            end
        end
    end


    
    def welcome_message
        puts "\nWelcome to the view exhibitions menu.".colorize(:white)
    end


    def command_list
        puts "\n1. View all your exhibitions.".colorize(:light_cyan)
        puts "2. View previous exhibitions.".colorize(light_blue)
        puts "3. View upcoming exhibitions.".colorize(:light_cyan)
        puts "4. View exhibitions you are collaboration on.".colorize(:light_blue)
        puts "5. View your exhibition bookings".colorize(:light_cyan)
        puts "6. Return to main dashboard.".colorize(:light_blue)
    end

    
    def get_user_command
        puts "\nPlease enter a command number.(1-6)".colorize(:white)
        gets.chomp
    end

end