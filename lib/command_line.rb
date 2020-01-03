def greeting
 
puts "    ._____. ._____. ._____. ._____.
    | ._. | | ._. | | ._. | | ._. |
    | !_| |_|_|_! | | !_| |_|_|_! |
    !___| |_______! !___| |_______!
    .___|_|_| |_________|_|_| |___.
    | ._____| |_____________| |_. |
    | !_! | | |         | | ! !_! |
    !_____! | |  BOARD  | | !_____!
    ._____. | |  GAME   | | ._____.
    | ._. | | |  SHELF  | | | ._. |
    | !_| |_|_|_________| |_|_|_! |
    !___| |_____________| |_______!
    .___|_|_| |___. .___|_|_| |___.
    | ._____| |_. | | ._____| |_. |
    | !_! | | !_! | | !_! | | !_! |
    !_____! !_____! !_____! !_____!"
    
    # puts " BOARD GAMES \n
    # BOARD GAMES \n
    #     BOARD GAMES \n
    #         BOARD GAMES \n
    #             BOARD GAMES \n"
end 

def get_input

    return gets.strip.downcase
end 

def invalid_command 

    puts "Invalid input. Please try again. \n\n"
end 

def exit_program

    puts "Exiting program. Goodbye!"
end 

def user_output(user)
    if user == nil 
        puts "No user currently"
    else
        puts "Currently logged in as: #{user.first_name} #{user.last_name}"
    end 
end 

def user_login_options 

    puts "You are under user login. Options are below:
    exit: exit from login procedure
    list: lists all existing users
    help: displays this list of options"
end 


def check_user(split, input)

    user_firstname = User.where('lower(first_name) = ?', split.first)
    user_lastname = User.where('lower(last_name) = ?', split.last)
    
    if user_firstname.count == 0 || user_lastname.count == 0 
        puts "User not found"
    elsif (user_firstname[0].id == user_lastname[0].id)
        #have to get the user id because different objects are summoned for each db search
        user = user_firstname[0]
        puts "User found: #{user}. Name: #{user.first_name} #{user.last_name}"
        return user 
    else 
        puts "User not found"
    end 
end 

def user_login(user)
    #user enters login info
    #if login info does not match any users, asks again
    #once login info returns something, returns that user 

    user_login_options 

    loop do 

        puts "User login:"
        input = get_input 
        #splits the input into array, get first and last from this array 
        split = input.gsub(/\s+/m, ' ').gsub(/^\s+|\s+$/m, '').split(" ")

        case input 
            when 'exit'

                puts "Exiting. No user changed."
                puts "You are now back to the list of main options"
                break #breaks loop, if there was a previous user, does not purge them and returns same user 
            when 'list'
                puts "Current list of users:"
                User.all.each {|user| puts "#{user.first_name} #{user.last_name}"}
            when 'help'

                user_login_options 
            else 

                return check_user(split, input)
        end 
    end 
    return user 
end 

def user_logout(user = nil) # purges logged user object 

    return user = nil 
end 

def find_game 
    #finds a game from list of all games 
    puts "Please enter the game name: "
    input = get_input 
    return Game.where('lower(name) = ?', input)
end 


def owners_of_game(game)
    #handles the process of find_game 
    if game.count == 0 
        puts "Game not found"
    else 
        Game.print_game_owners(game) 
    end 
end 