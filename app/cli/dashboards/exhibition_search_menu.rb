class ExhibitionSearchMenu

    attr_reader :user

    def initialize(user)
        @user = user
    end

    def run
        welcome_message
        while(true)
            command_list
            command = get_user_command
            #binding.pry
            if(command == "1")
                search_by_exhibition_name
            elsif(command == "2")
                search_by_artist_name
            elsif(command == "3")
                search_by_style
            elsif(command == "4")
                search_by_curator
            elsif(command == "5")
                search_by_location
            elsif(command == "6")
                break
            else
                puts "The number you entered did not relate to a command, try again."
            end
        end
    end

    def search_by_location
        puts "\nWhat Location would you like to search for?"
        location = gets.chomp
        result = Exhibition.where("location = ?", location)
        list_exhibitions(result, location)
        if user != nil
            booking_menu = BookingMenu.new(user, result)
            booking_menu.run
        end
    end

    def search_by_curator
        puts "\nWhat Curator would you like to search for?"
        curator = gets.chomp
        result = Exhibition.joins(:curator).where("curators.name = ?", curator)
        list_exhibitions(result, curator)
        if user != nil
            booking_menu = BookingMenu.new(user, result)
            booking_menu.run
        end
    end

    def search_by_style
        puts "\nWhat style would you like to search for?"
        style = gets.chomp
        result = Exhibition.search_by_style(style)
        list_exhibitions(result, style)
        if user != nil
            booking_menu = BookingMenu.new(user, result)
            booking_menu.run
        end
    end

    def search_by_artist_name
        puts "\nWhat Artist would you like to search for?"
        name = gets.chomp
        result = Exhibition.joins(:artist).where("artists.name = ?", name)
        list_exhibitions(result, name)
        if user != nil
            booking_menu = BookingMenu.new(user, result)
            booking_menu.run
        end
    end

    def search_by_exhibition_name
        puts "\nWhat name would you like to search for?"
        name = gets.chomp
        result = Exhibition.search_by_name(name)
        list_exhibitions(result, name)
        if user != nil
            booking_menu = BookingMenu.new(user, result)
            booking_menu.run
        end
    end

    def list_exhibitions(arr_exhibitions, term)
        if(arr_exhibitions.length > 0)
            count = 1
            puts "\nThe exhibitions for search term: #{term} are;"
            arr_exhibitions.each do |e| 
                puts "#{count}. #{e.name}"
                count += 1
            end 
        else
            puts "\nThe have no exhibitions on record for search term: #{term}."
        end
    end

    def welcome_message
        puts "\nWelcome to the Search Exhibition Menu."
    end

    def command_list
        puts "\n1. Search Exhibitions by name."
        puts "2. Search Exhibitions by Artist."
        puts "3. Search Exhibitions by Style."
        puts "4. Search Exhibitions by Curator."
        puts "5. Search Exhibitions by Location."
        puts "6. Quit to main dashboard."
    end

    def get_user_command
        puts "\nPlease enter a command number.(1-6)"
        gets.chomp
    end

end