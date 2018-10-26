class CuratorViewExhibitions

    attr_reader :curator

    def initialize(curator)
        @curator = curator
    end

    def run
        welcome_message
        while(true)
            command_list
            command = get_user_command
            today_date = Date.today
            if(command == "1")
                list_exhibitions(curator.get_exhibitions)
            elsif(command == "2")
                list_exhibitions(curator.get_previous_exhibitions(today_date), "previous ")
            elsif(command == "3")
                list_exhibitions(curator.get_upcoming_exhibitions(today_date), "upcoming ")
                collaboration_menu = AddCollaboration.new(curator.get_upcoming_exhibitions(today_date))
            elsif(command == "4")
                puts "\nWhich exhibition would you like to see the Artists for?"
                selected = gets.chomp
                if(curator.get_exhibitions.length >= selected.to_i)
                    id = curator.get_exhibitions[selected.to_i - 1].id
                    artists = Artist.joins(:collaborations, :exhibitions).where("exhibitions.id = ?", 1)
                    list_artists(artists)
                else
                    puts "That command did not relate to an exhibition."
                end
            elsif(command == "5")
                break
            else
                puts "The number you entered did not relate to a command, try again."
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

    def list_exhibitions(arr_exhibitions, state="")
        
        while(true)
            if(arr_exhibitions.length > 0)

                
                puts "\n#{state.capitalize} Exhibitions"
                arr_exhibitions.each do |e| 
                    puts "#{arr_exhibitions.index(e)+1}. #{e.name} - #{e.date}, #{e.location}"
                    puts "#{curator.exhibition_visitor_count(e)} tickets sold"
                    
                end
            
                puts "To view attendees, please enter the name of the exhibition, else press zero to quit"
        
                command = gets.chomp

             
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
        puts "4. View Artist collaboration on exhibition."
        puts "5. Quit to main dashboard."
    end

    def get_user_command
        puts "\nPlease enter a command number.(1-5)"
        gets.chomp
    end

end