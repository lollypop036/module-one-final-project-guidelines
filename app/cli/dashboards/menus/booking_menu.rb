class BookingMenu

    attr_reader :user, :exhibition_array

    def initialize(user, exhibition_array)
        @user = user
        @exhibition_array = exhibition_array
    end

    def run
        prompt = TTY::Prompt.new
        while(true)
            command = command_list(prompt)
            if(command == "Make a booking.")
                make_booking(prompt)
            elsif(command == "Return to search Menu.")
                break
            else
                puts "The number you entered did not relate to a command, try again.".colorize(:red)
            end
        end
    end

    def make_booking(prompt)
        if(exhibition_array.length == 1)
            user.make_exhibition_booking(exhibition_array[0].name)
        else
            selection = exhibition_array.map{|e| e.name}
            selected = prompt.select("\nWhat exhibition would you like to make a booking for?", selection)
            user.make_exhibition_booking(selected)
        end
    end

    def command_list(prompt)
        array = ["Make a booking.", "Return to search Menu."]
        prompt.select("\nWould you like to make a booking?", array)
    end

end