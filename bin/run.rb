require_relative '../config/environment'


def help(login=nil)

    #shows list of commands
    puts "exit : Exits the program"
    puts "help : Gets this list of options"
    puts "login : Logs in or change user to compare games"
    puts "logout : Logs out of user"
    puts "most_owned : Finds the most owned games "

    if login!= nil 

        #puts following commands as well

    end 
    
end 

def run 
    greeting 
    #user_login 
    help 
    puts "Please enter a command: "

    loop do 

        input = get_input 
        #put user_login here?
        login = nil 

        case input 
            when 'exit'
                exit_program
                break 
            when 'help'
                help 
            when 'login'
                user_login 
                #login = 1  formerly here but that presents a problem of being logged in even if user typed exit out of login loop
                #need to make helper method to see if there's a user object present
                #then set login = helper_method which returns either nil or 1
            when 'logout'
                user_logout
                login = nil 
            when 'most_owned'
                Collection.most_owned_game_printer
            else 
                invalid_command 
                help 
        end 
    end 
end 


#run the program until the user exits 
run 