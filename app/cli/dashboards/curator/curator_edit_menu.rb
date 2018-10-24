class CuratorEditMenu

    attr_reader :curator

    def initialize(curator)
        @curator = curator
    end

    def run
        welcome_message
        command_list
        get_user_input
    end

    def welcome_message
        puts "\nWelcome to the Edit menu."
    end
    
    def command_list
        puts "1. Change name."
        puts "2. Change Username."
        puts "3. Change Password."
        puts "4. Quit to main dashboard."
    end

    def get_user_input
        puts "\nPlease enter a command number.(1-6)"
        gets.chomp
    end

end