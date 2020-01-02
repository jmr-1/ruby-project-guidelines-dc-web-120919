class User < ActiveRecord::Base 

    has_many :collections
    has_many :games, through: :collections

    def display_user_games 

        self.games.each do |game|
            puts "#{game.name}, "
        end 
        STDOUT.flush 
    end 

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
        #prints collection_worth 
        puts "Your collection is worth: $#{self.collection_worth}"
    end 


    def collection_average
        #finds logged in user's collection mean 
        return average_worth = self.collection_worth / self.games.count 
    end 

    def print_collection_average
        #prints collection_average
        puts "Your collection's average is: $#{self.collection_average}"
    end 

    def collection_variance 
        
        sum = 0
        m = self.collection_average
        self.games.each do |game|

            sum += (game.price)**2
        end 

        total_variance = (sum/self.games.count) - m**2

        return total_variance
    end
    
    def standard_deviation_collection

        return Math.sqrt(self.collection_variance)
    end 

    def print_standard_deviation_collection 

        puts "Your collection's pricing standard deviation is: $#{self.standard_deviation_collection}"
    end 

    def print_collection_stats 

        print_collection_worth
        print_collection_average
        print_standard_deviation_collection
    end 

    def choose_games 

        puts "Choose a game: "
        chosen_games = []
        loop do 
            input = get_input 
            game = Game.all.where('lower(name) = ?', input)
            if game != nil 
            chosen_games << game 
            end 
        break if get_input == 'stop' || get_input == ''
        end 
        return chosen_games 
    end 


    #bug: chosen_games is embedding arrays within arrays, check line 120 with game[0] and 
    #line 123 requires fave_game[0].favorite 
    def add_favorite 
        #user can add a game to favorites list 
        puts "Add your favorites (type 'stop' or press enter without text when finished): "
        chosen_games = self.choose_games 
        #checks game against collection and sets favorite to true 
        chosen_games.each do |game|
            binding.pry 
            fave_game = Collection.all.where(user_id: self.id, game_id: game[0].id)
            fave_game.favorite = true 
        end 
    end 
end 