class Collection < ActiveRecord::Base

    belongs_to :user
    belongs_to :game

    def self.owned_games  #sorts all owned games by frequency and returns it 

        frequency = Hash.new(0)
        Collection.all.each do |collection|
            
            game_id = collection.game.name 
            
            if frequency[game_id]
                frequency[game_id] += 1
            else 
                frequency[game_id] = 1 
            end 
        end 
        return frequency.sort_by {|title, num| num}.reverse 
    end 

    def self.most_owned_game #finds the most owned gamed from owned games hash 

        max_quantity = 0 
        hash_max = Hash.new(0)
        game_list = self.owned_games 

        game_list.each do |game, num |

            if num >= max_quantity
                hash_max[game] = num 
                max_quantity = num 
            end 
        end 
        return hash_max 
    end 

    def self.most_owned_game_printer #prints most owned game results to console

        most_games = self.most_owned_game

        if most_games.count == 1 
            puts "The most owned game is: "
            most_games.each do |game,num|
                puts "#{game} with #{num} copies owned by everyone."
            end 
        else 
            puts "The most owned games are: "
            game_num = 0 
            most_games.each do |game,num|
                puts "#{game} \n"
                game_num = num 
            end 
            puts "with a total of #{game_num} owned for each game."
        end     
    end 

    def self.top_50_games_chart 


    end 

end 