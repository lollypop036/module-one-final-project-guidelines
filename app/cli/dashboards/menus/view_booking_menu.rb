class ViewBookingMenu

    attr_reader :user, :prompt
    attr_accessor :bookings

    def initialize(user, prompt)
        @user = user
        @prompt = prompt
        @bookings = []
    end

    def run
        list_bookings
        while(true)
            command = command_list
            if(command == "Delete a Booking.")
                delete_booking
            elsif(command == "Quit to main dashboard.")
                break
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

    def command_list
        array = ["Delete a Booking.", "Quit to main dashboard."]
        prompt.select("\nWelcome to the view exhibitions menu.", array)
    end

end