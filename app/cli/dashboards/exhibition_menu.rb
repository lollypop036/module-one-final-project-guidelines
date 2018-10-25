class ExhibitionMenu

    attr_reader :user

    def initialize(user=nil)
        @user = user
    end

    def run
        welcome_message
        while(true)
            command_list
            command = get_user_command
            if(command == "1")
                view_menu = ExhibitionViewMenu.new
                view_menu.run
                break
            elsif(command == "2")
                search_menu = ExhibitionSearchMenu.new(user)
                search_menu.run
                break
            elsif(command == "3")
                break
            else
                puts "The number you entered did not relate to a command, try again."
            end
        end
    end

    def welcome_message
        puts "\nWelcome to the Exhibition Menu."
    end

    def command_list
        puts "\n1. View Exhibitions."
        puts "2. Search Exhibitions."
        puts "3. Quit to main dashboard."
    end

    def get_user_command
        puts "\nPlease enter a command number.(1-3)"
        gets.chomp
    end

end