class ViewBookingMenu

    attr_reader :user
    attr_accessor :bookings

    def initialize(user)
        @user = user
        @bookings = []
    end

    def run
        welcome_message
        list_bookings
        while(true)
            command_list
            command = get_user_command
            if(command == "1")
                delete_booking
            elsif(command == "2")
                break
            else
                puts "The number you entered did not relate to a command, try again."
            end
        end    
    end

    def delete_booking
        if(bookings.length == 1)
            bookings[0].destroy
            puts "\nBooking has been deleted."
        elsif(bookings.length == 0)
            puts "\nYou have no bookings."
        else
            puts "\nWhich booking would you like to delete?(select by booking number)"
            id = gets.chomp
            bookings[id.to_i - 1].destroy
            puts "Booking has been deleted."
        end
    end

    def list_bookings
        get_bookings
        if bookings.length > 0
            count = 1
            bookings.each do |x|  
                exhibition = Exhibition.find(x.exhibition_id)
                puts "\nBooking #{count}."
                puts "------------------------"
                puts "#{exhibition.name} - Details" 
                puts "Date: #{exhibition.date}"
                puts "Location: #{exhibition.location}"
                puts "Style: #{exhibition.style}"
                count += 1
            end
        else
            puts "\nYou have no bookings on record."
        end
    end

    def get_bookings
        if user.class == User
            @bookings = Booking.search_by_user_id(user.id)
        elsif user.class == Artist
            @bookings = Booking.search_by_artist_id(user.id)
        elsif user.class == Curator
            @bookings = Booking.search_by_curator_id(user.id)
        end 
    end

    def welcome_message
        puts "\nWelcome to the Bookings Menu."
    end

    def command_list
        puts "\n1. Delete a Booking."
        puts "2. Quit to main dashboard."
    end

    def get_user_command
        puts "\nPlease enter a command number.(1-2)"
        gets.chomp
    end

end