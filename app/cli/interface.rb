class Interface

    def run
        welcome_message
        while(true)
            puts "What would you like to do? (sign-in - s, create-account - a, continue-as-guest - g or quit - q)"
            command = gets.chomp
            if(command == "s")
                #login page
                puts "y"
                break
            elsif(command == "a")
                #create_account page
                puts "Would "
                break
            elsif(command == "g")
                #continue as guest
                puts "g"
                break
            elsif(command == "q")
                puts "Thank you, Good-bye!"
                break
            else
                puts "Invalid command."
            end
        end
    end

    def welcome_message
        puts "Welcome to Art World!"
    end

end