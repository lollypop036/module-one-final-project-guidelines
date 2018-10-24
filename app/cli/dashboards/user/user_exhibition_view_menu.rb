class UserExhibitionViewMenu

    attr_reader :user

    def initialize(user)
        @user = user
    end

    def run
    end

    def welcome_message
    end

    def command_list
    end

    def get_user_command
        puts "\nPlease enter a command number.(1-3)"
        gets.chomp
    end

end