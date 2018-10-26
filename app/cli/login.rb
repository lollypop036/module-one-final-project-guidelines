class Login

    attr_reader :prompt

    def initialize(prompt)
        @prompt = prompt
    end

    def run
        while(true)
            puts
            username = prompt.ask("Please enter a Username.")
            puts
            password = prompt.mask("Please enter a Username.")
            if(is_artists?(username, password))
                artist = Artist.get_artist(username, password)
                dashboard = ArtistDashboard.new(artist, prompt)
                dashboard.run
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

end