class CuratorDashboard

    attr_reader :curator

    def initialize(curator)
        @curator = curator
    end

    def run
        welcome_message
    end

    def welcome_message
        puts "Welcome Curator #{curator.name}."
    end

end