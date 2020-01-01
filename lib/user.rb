class User < ActiveRecord::Base 

    has_many :collections
    has_many :games, through: :collections


    
    def find_duplicate_games
        #searches if user has duplicate games 

        owned_games = self.games 
        return owned_games.select{|game| owned_games.count(game) > 1 }.uniq
    end 

    def print_duplicate_games

        game_list = self.find_duplicate_games 

        if game_list.count >= 1
            puts "Your duplicate games:"
            binding.pry 
            game_list.each {|game| game.name}

        else 
            puts "Congratulations, you don't have any duplicate games!"
        end 
    end 


    def collection_worth 

        total_worth = 0 
        self.games.each {|game| total_worth += game.price}
        return total_worth 
    end 

    def print_collection_worth

        puts "Your collection is worth: $#{self.collection_worth}"
    end 
end 