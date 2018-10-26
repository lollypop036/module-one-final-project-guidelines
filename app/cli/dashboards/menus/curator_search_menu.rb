class CuratorSearchMenu


    def run
        while(true)
            command_list
            command = get_user_command
            if command == "1"
                search_curators
            elsif command == "2"
                break
            else
                puts "The number you entered did not relate to a command, try again.".colorize(:red)
            end
        end
    end


    def get_user_command
        puts "\nPlease enter a command number.(1-2)".colorize(:white)
        gets.chomp
    end

    def command_list
        puts "\n1. Search curators".colorize(:light_blue)
        puts "2. Go back".colorize(:light_cyan)
    end



    def search_curators
        
        while(true)

            puts "\nPlease choose your search criteria from the options below:".colorize(:white)

            puts "1. Name".colorize(:light_blue)
            puts "2. Location".colorize(:light_cyan)
            search = gets.chomp

            case search

                when "1"
                    puts "\nEnter name".colorize(:white)
                    search = gets.chomp
                    list_artists(Curator.search_by_name(search))
                    break
                when "2"
                    puts "\nEnter location".colorize(:white)
                    search = gets.chomp
                    list_artists(Curator.search_by_location(search))

                    break
                else
                "Please enter a valid number".colorize(:red)
            end
        end
     end


     def list_artists(curators)
        if curators.length > 0
            count = 1
            curators.each do |x|  
                puts "\nCurator #{count}.".colorize(:white)
                puts "------------------------".colorize(:white)
                puts "Name: #{x.name}".colorize(:light_blue)
                puts "Location: #{x.location}".colorize(:light_cyan)
                count += 1
            end
        else
            puts "\nNo curators were found.".colorize(:light_blue)
        end
     end
end