require_relative '../config/environment'


def help(user)

    #shows list of commands
    puts "exit : Exits the program"
    puts "help : Gets this list of options"
    puts "login : Logs in or change user to compare games"
    puts "logout : Logs out of user"
    puts "most_owned : Finds the most owned games"
    puts "user: Shows currently logged in user"

    if user!= nil 

        #puts following commands as well
        puts "****"
        puts "additional logged in features below:"
    end 
    
end 

def run 

    greeting 
    user = nil 
    help(user)
    

    loop do 
        puts "Please enter a command: "
        input = get_input 

        case input 
            when 'exit'
                exit_program
                break 
            when 'help'
                help(user)
            when 'login'
                user = user_login(user)
            when 'user'
                user_output(user) 
            when 'logout'
                user = user_logout
            when 'most_owned'
                Collection.most_owned_game_printer
            else 
                invalid_command 
                help(user)
        end 
    end 
end 


#run the program until the user exits 
run 