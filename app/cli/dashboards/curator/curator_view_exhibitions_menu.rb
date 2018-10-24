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
            puts "\nYour #{state}exhibitions are;"
            arr_exhibitions.each do |e| 
                puts "#{count}. #{e.name}"
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
        puts "4. Quit to main dashboard."
    end

    def get_user_command
        puts "\nPlease enter a command number.(1-4)"
        gets.chomp
    end

end