class ArtistViewExhibitionsMenu 


    attr_reader :artist, :prompt

    def initialize(artist, prompt)
        @artist = artist
        @prompt = prompt
    end

    def run
        while(true)
            command = command_list
            if(command == "View all your exhibitions.")
                list_exhibitions(artist.get_exhibitions)
            elsif(command == "View previous exhibitions.")
                list_exhibitions(artist.get_previous_exhibitions, "previous ")
            elsif(command == "View upcoming exhibitions.")
                list_exhibitions(artist.get_upcoming_exhibitions, "upcoming ")
            elsif(command == "View exhibitions you are collaboration on.")
                list_exhibitions(Exhibition.joins(:collaborations, :artists).where("artists.id = ?", 1).distinct)
            elsif(command == "View your exhibition bookings")
                artist_bookings = ViewBookingMenu.new(artist, prompt)
                artist_bookings.run
            elsif(command == "Return to main dashboard.")
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
            
                puts "\nTo view attendees, please enter the name of the exhibition, else press zero to quit".colorize(:light_blue)
        
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
                puts "\nYou have no #{state}exhibitions on record.".colorize(:light_cyan)
                break
            end
        end
    end

    def command_list
        array = ["View all your exhibitions.", "View previous exhibitions.", "View upcoming exhibitions.", "View exhibitions you are collaborating on", "View your exhibition bookings", "Return to main dashboard."]
        prompt.select("\nYour Exhibitions", array)
    end

end