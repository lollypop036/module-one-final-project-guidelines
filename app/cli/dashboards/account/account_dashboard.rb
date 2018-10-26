class AccountDashboard

    def run
        welcome_message
        while(true)
            puts "\nWhich type of account would you like to create?(artist, curator, user)"
            account = gets.chomp
            if(account.downcase == "artist")
                artist = create_artist_account
                dashboard = ArtistDashboard.new(artist)
                dashboard.run
                break
            elsif(account.downcase == "curator")
                curator = create_curator_account
                dashboard = CuratorDashboard.new(curator)
                dashboard.run
                break
            elsif(account.downcase == "user")
                user = create_user_account
                dashboard = UserDashboard.new(user)
                dashboard.run
                break
            else
                puts "That response was not a recognised account type."
            end
        end
    end

    def create_user_account
        user = User.create(name: get_name, location: get_location, username: get_username, password: get_password)
        puts "Account was successfully created."
        user
    end

    def create_curator_account
        curator = Curator.create(name: get_name, location: get_location, username: get_username, password: get_password)
        puts "Account was successfully created."
        curator
    end

    def create_artist_account
        artist = Artist.create(name: get_name, location: get_location, username: get_username, password: get_password, style: get_style)
        puts "Account was successfully created."
        artist
    end

    def get_name
        puts "\nPlease enter your name."
        gets.chomp
    end

    def get_location
        puts "\nPlease enter your location."
        gets.chomp
    end

    def get_username 
        puts "\nPlease enter a username."
        gets.chomp
    end

    def get_password
        puts "\nPlease enter a password."
        gets.chomp
    end

    def get_style
        puts "\nPlease enter a style."
        gets.chomp
    end



    def welcome_message
        puts "\nWelcome to the Account Creation Menu."
    end

    def command_list
        puts "\nWhich type of account would you like to create?"
    end

end