class Login

    def run
        while(true)
            username = get_username
            password = get_password
            if(is_artists?(username, password))
                artist = Artist.get_artist(username, password)
                puts "Artist yes"
                puts artist
                break
            elsif(is_curator?(username, password))
                curator = Curator.get_curator(username, password)
                dashboard = CuratorDashboard.new(curator) 
                dashboard.run
                break
            elsif(is_user?(username, password))
                user = User.get_user(username, password)
                dashboard = UserDashboard.new(user)
                dashboard.run
                puts "User yes"
                break
            elsif(username == "exit" || password == "exit")
                break
            else
                puts "Username or password is invalid."
            end
        end
    end

    def is_artists?(username, password)
        if(Artist.search_credentials(username, password))
            true
        else
            false
        end
    end

    def is_curator?(username, password)
        if(Curator.search_credentials(username, password))
            true
        else
            false
        end
    end

    def is_user?(username, password)
        if(User.search_credentials(username, password))
            true
        else
            false
        end
    end

    def get_password
        puts "Please enter a password.(type exit to quit)"
        gets.chomp
    end

    def get_username
        puts "Please enter a Username.(type exit to quit)"
        gets.chomp
    end


end