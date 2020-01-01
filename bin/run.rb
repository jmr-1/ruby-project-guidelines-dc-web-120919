require_relative '../config/environment'


def help(user)

    #shows list of commands
    puts "You are in the main menu. Options are below:"
    puts "exit : Exits the program"
    puts "help : Gets this list of options"
    puts "most_owned : Finds the most owned games"
    puts "top_games : Displays the top x games"
    puts "expensive : Finds games above x price"
    puts "budget : Finds games below x price"
    puts "user : Shows currently logged in user"
    puts "login : Logs in or change user to compare games"
    puts "logout : Logs out of user"
    if user!= nil 
        #puts following commands if user is logged in 
        puts "additional logged in features below:"
        puts "duplicate : Finds and displays duplicate games"
        puts "collection_worth : Finds the total value of this user's collection"
    end 
    
end 

def run 

    greeting 
    user = nil 
    help(user)
    
    loop do 
        puts "Please enter a command: "
        input = get_input 

        #any features that require logged in searching by user means it might need another loop/case 
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
            when 'top_games'
                Collection.top_x_games_chart 
            when 'expensive'
                Game.print_expensive_games 
            when 'budget'
                Game.print_budget_games 
            when 'duplicate' 
                if user != nil 
                    user.print_duplicate_games    
                else 
                    invalid_command 
                end     
            when 'collection_worth'
                if user != nil
                    user.print_collection_worth
                else
                    invalid_command
                end  
            else 
                invalid_command 
                help(user)
        end 
    end 
end 


#run the program until the user exits 
run 