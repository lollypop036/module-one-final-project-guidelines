class BookingMenu

    attr_reader :user, :exhibition_array

    def initialize(user, exhibition_array)
        @user = user
        @exhibition_array = exhibition_array
    end

    def run
        welcome_message
        while(true)
            command_list
            command = get_user_command
            if(command == "1")
                if user.class == User
                    make_user_booking
                    break
                elsif user.class == Artist
                    make_artist_booking
                    break
                elsif user.class == Curator
                    make_curator_booking
                    break
                end
            elsif(command == "2")
                break
            else
                puts "The number you entered did not relate to a command, try again."
            end
        end
    end

    def make_user_booking
        if(exhibition_array.length == 1)
            Booking.create(user_id: user.id, exhibition_id: exhibition_array[0].id)
            puts "Booking has been made."
        else
            puts "\nWhat exhibition would you like to make a booking for?(select by number)"
            selected = gets.chomp
            index = selected.to_i - 1
            Booking.create(user_id: user.id, exhibition_id: exhibition_array[index].id)
            puts "Booking has been made."
        end
    end
    
    def make_artist_booking
        if(exhibition_array.length == 1)
            Booking.create(artist_id: user.id, exhibition_id: exhibition_array[0].id)
            puts "Booking has been made."
        else
            puts "\nWhat exhibition would you like to make a booking for?(select by number)"
            selected = gets.chomp
            index = selected.to_i - 1
            Booking.create(artist_id: user.id, exhibition_id: exhibition_array[index].id)
            puts "Booking has been made."
        end
    end

    def make_curator_booking
        if(exhibition_array.length == 1)
            Booking.create(curator_id: user.id, exhibition_id: exhibition_array[0].id)
            puts "Booking has been made."
        else
            puts "\nWhat exhibition would you like to make a booking for?(select by number)"
            selected = gets.chomp
            index = selected.to_i - 1
            Booking.create(curator_id: user.id, exhibition_id: exhibition_array[index].id)
            puts "Booking has been made."
        end
    end

    def welcome_message
        puts "Would you like to make a booking?"
    end

    def command_list
        puts "\n1. Make a booking."
        puts "2. Return to search Menu."
    end

    def get_user_command
        puts "\nPlease enter a command number.(1-2)"
        gets.chomp
    end

end