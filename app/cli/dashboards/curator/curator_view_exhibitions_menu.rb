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
                puts "\nWhich exhibition would you like to see the Artists for?".colorize(:white)
                selected = gets.chomp
                if(curator.get_exhibitions.length >= selected.to_i)
                    id = curator.get_exhibitions[selected.to_i - 1].id
                    artists = Artist.joins(:collaborations, :exhibitions).where("exhibitions.id = ?", 1)
                    list_artists(artists)
                else
                    puts "That command did not relate to an exhibition.".colorize(:red)
                end
            elsif(command == "5")
                break
            else
                puts "The number you entered did not relate to a command, try again.".colorize(:red)
            end
        end
    end

    def list_artists(artists)
        if artists.length > 0
            count = 1
            artists.each do |x|  
                puts "\nArtist #{count}.".colorize(:white)
                puts "------------------------".colorize(:white)
                puts "Name: #{x.name}".colorize(:light_cyan)
                puts "Location: #{x.location}".colorize(:light_blue)
                puts "Style: #{x.style}".colorize(:light_cyan)
                count += 1
            end
        else
            puts "\nNo artists were found.".colorize(:white)
        end
    end

    def list_exhibitions(arr_exhibitions, state="")
        
        while(true)
            if(arr_exhibitions.length > 0)

                
                puts "\n#{state.capitalize} Exhibitions".colorize(:light_blue)
                arr_exhibitions.each do |e| 
                    puts "#{arr_exhibitions.index(e)+1}. #{e.name} - #{e.date}, #{e.location}".colorize(:light_blue)
                    puts "#{curator.exhibition_visitor_count(e)} tickets sold".colorize(:light_cyan)
                    
                end
            
                puts "\nTo view attendees, please enter the name of the exhibition, else press zero to quit".colorize(:white)
                
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

    def welcome_message
        puts "\nWelcome to the view exhibitions menu.".colorize(:white)
    end

    def command_list
        puts "\n1. View all your exhibitions.".colorize(:light_cyan)
        puts "2. View previous exhibitions.".colorize(:light_blue)
        puts "3. View upcoming exhibitions.".colorize(:light_cyan)
        puts "4. View Artist collaboration on exhibition.".colorize(:light_blue)
        puts "5. Quit to main dashboard.".colorize(:light_cyan)
    end

    def get_user_command
        puts "\nPlease enter a command number.(1-5)".colorize(:white)
        gets.chomp
    end

end