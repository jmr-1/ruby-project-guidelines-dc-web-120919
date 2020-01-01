class Game < ActiveRecord::Base

    has_many :collections
    has_many :users, through: :collections 


    def self.find_expensive_games
        input = 0 
        loop do 
            puts "Please enter an amount: "
            input = get_input.to_i
            break input if input > 0 
        end 
        return self.all.select{|game| game.price > input }
    end 

    def self.print_expensive_games 

        expensive_games = self.find_expensive_games 
        puts "These are the games worth more than what you asked:"
        expensive_games.each {|game| puts game.name}
    end 
end 