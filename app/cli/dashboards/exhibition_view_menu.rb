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
                puts "The number you entered did not relate to a command, try again."
            end
        end
    end

    def list_exhibitions(arr_exhibitions, state="")
        if(arr_exhibitions.length > 0)
            count = 1
            puts "\nThe #{state}exhibitions are;"
            arr_exhibitions.each do |e| 
                puts "#{count}. #{e.name}"
                count += 1
            end 
        else
            puts "\nThe have no #{state}exhibitions on record."
        end
    end

    def welcome_message
        puts "\nWelcome to the View Exhibitions Menu."
    end

    def command_list
        puts "\n1. View all Exhibitions."
        puts "2. View previous Exhibitions."
        puts "3. View upcoming Exhibitions."
        puts "4. Quit to Exhibition main menu."
    end

    def get_user_command
        puts "\nPlease enter a command number.(1-4)"
        gets.chomp
    end

end