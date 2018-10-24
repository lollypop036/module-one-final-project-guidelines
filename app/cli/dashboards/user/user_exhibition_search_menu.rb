class UserExhibitionSearchMenu

    attr_reader :user

    def initialize(user)
        @user = user
    end

    def run
        welcome_message
        while(true)
            command_list
            command = get_user_command
            if(command == "1")
                search_by_name
            elsif(command == "2")
                break
            elsif(command == "3")
                break
            elsif(command == "4")
                break
            elsif(command == "5")
                break
            elsif(command == "6")
                break
            else
                puts "The number you entered did not relate to a command, try again."
            end
        end
    end

    def search_by_name
        puts "\nWhat name would you like to search for?"
        name = gets.chomp
        result = Exhibition.search_by_name(name)
        list_exhibitions(result, name)
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