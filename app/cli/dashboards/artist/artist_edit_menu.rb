class ArtistEditMenu

attr_reader :artist

def initialize(artist)
    @artist = artist
end

    def change_name
        puts "\nChange Name."
        puts "\nWhat would you like to change your name to?"
        name = gets.chomp
        artist.name = name
        artist.save
        if(artist.name == name)
            puts "The name change was successful."
        else
            puts "The name change failed."
        end
    end

    def change_username
        puts "\nChange Username."
        puts "\nWhat would you like to change your username to?"
        username = gets.chomp
        artist.username = username
        artist.save
        if(artist.username == username)
            puts "The username change was successful."
        else
            puts "The username change failed."
        end
    end

    def change_password
        puts "\nChange Password."
        puts "\nWhat would you like to change your password to?"
        password = gets.chomp
        artist.password = password
        artist.save
        if(artist.password == password)
            puts "The password change was successful."
        else
            puts "The password change failed."
        end
    end





end