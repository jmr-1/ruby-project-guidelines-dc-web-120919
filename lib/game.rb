class Game < ActiveRecord::Base

    has_many :collections
    has_many :users, through: :collections 


    def self.find_expensive_games
        #find games above a certain price
        input = 0 
        loop do 
            puts "Please enter an amount: "
            input = get_input.to_i
            break input if input > 0 
        end 
        return self.all.select{|game| game.price > input }
    end 

    def self.print_expensive_games 
        #prints find_expensive_games array 
        expensive_games = self.find_expensive_games 
        puts "These are the games worth more than what you asked:"
        expensive_games.each {|game| puts game.name}
    end 

    def self.find_budget_games
        #find games below certain price
        #note: does not include games priced at 0.0 because those are usually out of stock/nil
        puts "Please enter an amount: "
        input = get_input.to_i 
        return self.all.select{|game| game.price < input && game.price > 0}
    end 

    def self.print_budget_games
        #prints find_budget_games array 
        budget_games = self.find_budget_games 
        puts "These are the games worth less than what you asked:"
        budget_games.each {|game| puts game.name}
        puts "Note: These games are priced above $0. Games with $0 price are out of stock or have no included value."
    end 

    def self.game_owners(game) 
        #returns the array of owners of this game 
        owners = Collection.all.select {|collection| collection.game == game[0]}
    end 

    def self.game_owners_unique(game)
        #returns unique array of owners 
        owners = self.game_owners(game)
        return owners.map {|owner| owner.user}.uniq 
    end 

    def self.print_game_owners(game) 
        #prints game_owners 
        game_owners = self.game_owners(game)
        game_owners_unique = self.game_owners_unique(game)
        puts "The number of owners of this game are #{game_owners_unique.count} and the owners are:"
        game_owners_unique.each do |owner| 
            #finds number of copies owned by each owner
            num_copies = game_owners.select{|collection| collection.user == owner}
            puts "#{owner.first_name} #{owner.last_name} with #{num_copies.count} copies"
        end 

    end 

end 