class CuratorDashboard

    attr_reader :curator

    def initialize(curator)
        @curator = curator
    end

    def run
        welcome_message
        command_list
    end

    def welcome_message
        puts "Welcome Curator #{curator.name}."
    end

    def command_list
        puts "\nWhat would you like to do?"
        puts "\n1. Edit profile."
        puts "2. View your Exhibitions."
        puts "3. Create a new Exhibition."
        puts "4. Search Artists."
        puts "5. Search Collaborations."
    end

end