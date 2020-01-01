class User < ActiveRecord::Base 

    has_many :collections
    has_many :games, through: :collections

    def num_each_game 
        #lists the number of copies user has 
        num_game = Hash.new(0)
        self.games.each do |game|
            num_game[game] += 1 
        end 
        return num_game 
    end 
    
    def find_duplicate_games
        #searches if user has duplicate games 
        game_list = self.num_each_game 
        return game_list.select {|game, num| num > 1}
    end 

    def print_duplicate_games

        game_list = self.find_duplicate_games 
        if game_list.count >= 1
            puts "Your duplicate games:"
            game_list.each {|game, num| puts game.name}
            if game_list.count >= 10
                puts "You might want to think of getting rid of some games!"
            end 
        else 
            puts "Congratulations, you don't have any duplicate games!"
        end 
    end 

    def collection_worth 
        #totals a user's collection value 
        total_worth = 0 
        self.games.each {|game| total_worth += game.price}
        return total_worth 
    end 

    def print_collection_worth

        puts "Your collection is worth: $#{self.collection_worth}"
    end 
end 