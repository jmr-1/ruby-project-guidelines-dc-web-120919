require_relative '../config/environment'


def help(user)

    #shows list of commands
    puts "You are in the main menu. Options are below:".yellow
    puts "leave : Exits the program".light_green
    puts "help : Gets this list of options".light_green
    puts "most_owned : Finds the most owned games".light_green
    puts "top_games : Displays the top x games".light_green
    puts "expensive : Finds games above x price".light_green
    puts "budget : Finds games below x price".light_green
    puts "owners_of_game : Finds and displays the owners of a certain game".light_green
    puts "user : Shows currently logged in user".light_green
    puts "login : Logs in or change user to compare games".light_green
    puts "logout : Logs out of user".light_green
    if user!= nil 
        #puts following commands if user is logged in 
        puts "*****"
        puts "additional logged in features below:".light_cyan
        puts "display_games: Displays user's owned games".light_cyan
        puts "duplicate : Finds and displays duplicate games".light_cyan
        puts "collection_stats : Displays user's collection stats".light_cyan
        puts "add_favorite : Allows user to choose favorite games".light_cyan
        puts "show_favorite : Allows user to show their favorite games from games they own".light_cyan
        puts "compare_favorites : Allows user to search for a specific favorite game and lists other users with same favorite game".light_cyan
    end 
    
end 

def run 

    greeting
    user = nil 
    help(user)
    
    loop do 
        
        puts "You are in the main menu."
        puts "Please enter a command: "
        input = get_input 

        #any features that require logged in searching by user means it might need another loop/case 
        case input 
            when 'leave'
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
            when 'owners_of_game'
                game = find_game 
                owners_of_game(game)
            when 'duplicate' 
                if user != nil 
                    user.print_duplicate_games    
                else 
                    invalid_command 
                end     
            when 'collection_stats'
                if user != nil
                    user.print_collection_stats
                else
                    invalid_command
                end 
            when 'display_games' 
                if user != nil
                    user.display_user_games
                else 
                    invalid_command 
                end 
            when 'add_favorite' 
                if user != nil
                    user.add_favorite
                else 
                    invalid_command
                end 
            when 'show_favorite'
                if user != nil
                    user.show_favorite
                else
                    invalid_command 
                end 
            when 'compare_favorites'
                if user != nil
                    user.compare_favorites
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