class AccountDashboard

    attr_reader :prompt

    def initialize(prompt)
        @prompt = prompt
    end

    def run
        welcome_message
        while(true)
            puts "\nWhich type of account would you like to create?(artist, curator, user)".colorize(:light_cyan)
            account = gets.chomp
            if(account.downcase == "artist")
                artist = create_artist_account
                dashboard = ArtistDashboard.new(artist, prompt)
                dashboard.run
                break
            elsif(account.downcase == "curator")
                curator = create_curator_account
                dashboard = CuratorDashboard.new(curator, prompt)
                dashboard.run
                break
            elsif(account.downcase == "user")
                user = create_user_account
                dashboard = UserDashboard.new(user, prompt)
                dashboard.run
                break
            else
                puts "That response was not a recognised account type.".colorize(:red)
            end
        end
    end

    def create_user_account
        user = User.create(name: get_name, location: get_location, username: get_username, password: get_password)
        puts "Account was successfully created.".colorize(:green)
        user
    end

    def create_curator_account
        curator = Curator.create(name: get_name, location: get_location, username: get_username, password: get_password)
        puts "Account was successfully created.".colorize(:green)
        curator
    end

    def create_artist_account
        artist = Artist.create(name: get_name, location: get_location, username: get_username, password: get_password, style: get_style)
        puts "Account was successfully created.".colorize(:green)
        artist
    end

    def get_name
        puts "\nPlease enter your name.".colorize(:light_blue)
        gets.chomp
    end

    def get_location
        puts "\nPlease enter your location.".colorize(:light_cyan)
        gets.chomp
    end

    def get_username 
        puts "\nPlease enter a username.".colorize(:light_blue)
        gets.chomp
    end

    def get_password
        puts "\nPlease enter a password.".colorize(:light_cyan)
        gets.chomp
    end

    def get_style
        puts "\nPlease enter a style.".colorize(:light_blue)
        gets.chomp
    end


    def welcome_message
        puts "\nWelcome to the Account Creation Menu.".colorize(:light_cyan)
    end

    def command_list
        puts "\nWhich type of account would you like to create?".colorize(:light_blue)
    end

end