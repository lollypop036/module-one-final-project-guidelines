class CreateMenu

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
                create_exhibition
                break
            elsif(command == "2")
                break
            else
                puts "The number you entered did not relate to a command, try again.".colorize(:red)
            end
        end
    end

    def create_exhibition
        puts "\nWhat is the title?".colorize(:white)
        title = gets.chomp
        puts "What is the date?(dd/mm/yyyy)".colorize(:white)
        date = gets.chomp
        puts "What is the location?".colorize(:white)
        location = gets.chomp
        puts "What is the time?".colorize(:white)
        time = gets.chomp
        exhibition = user.create_exhibition(title, date, location, time)
        puts "\nYou have create an exhibition, details below;".colorize(:light_blue)
        puts "title: #{exhibition.name}, date: #{exhibition.date}, location: #{exhibition.location}, time: #{exhibition.time}".colorize(:light_cyan)
    end

    def welcome_message
        puts "\nWelcome to the create Exhibition Menu.".colorize(:light_blue)
    end

    def get_user_command
        puts "\nPlease enter a command number.(1-2)".colorize(:white)
        gets.chomp
    end

    def command_list
        puts "\n1. Create new Exhibition.".colorize(:light_blue)
        puts "2. Quit to main dashboard.".colorize(:light_cyan)
    end

end