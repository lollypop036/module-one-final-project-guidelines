class ExhibitionViewMenu

    def run
        welcome_message
        while(true)
            command_list
            command = get_user_command
            today_date = Date.today
            if(command == "1")
                list_exhibitions(Exhibition.all)
            elsif(command == "2")
                list_exhibitions(Exhibition.view_previous_exhibitions(today_date), "previous ")
            elsif(command == "3")
                list_exhibitions(Exhibition.view_upcoming_exhibitions(today_date), "upcoming ")
            elsif(command == "4")
                break
            else
                puts "The number you entered did not relate to a command, try again.".colorize(:red)
            end
        end
    end

    def list_exhibitions(arr_exhibitions, state="")
        if(arr_exhibitions.length > 0)
            count = 1
            puts "\nThe #{state}exhibitions are;".colorize(:white)
            arr_exhibitions.each do |e| 
                puts "#{count}. #{e.name}".colorize(:light_cyan)
                count += 1
            end 
        else
            puts "\nThe have no #{state}exhibitions on record.".colorize(:light_cyan)
        end
    end

    def welcome_message
        puts "\nWelcome to the View Exhibitions Menu.".colorize(:white)
    end

    def command_list
        puts "\n1. View all Exhibitions.".colorize(:light_blue)
        puts "2. View previous Exhibitions.".colorize(:light_cyan)
        puts "3. View upcoming Exhibitions.".colorize(:light_blue)
        puts "4. Quit to Exhibition main menu.".colorize(:light_cyan)
    end

    def get_user_command
        puts "\nPlease enter a command number.(1-4)".colorize(:white)
        gets.chomp
    end

end