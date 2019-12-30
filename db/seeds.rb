#This can seed the database

require 'rest-client'
require 'json'
require 'pry'
require 'pp'
# require_relative '../config/environment'

#clean database first 
Game.destroy_all 

def get_games_api

    #make a web request
    #parse with JSON
    response_string = RestClient.get('https://www.boardgameatlas.com/api/search?name=Catan&client_id=OGh8WccUCc')
    response_hash = JSON.parse(response_string)
    return response_hash 
end 


#get specific info from the hash
#return the info to make sure we are getting the correct info

def title_parser(title)


    return title 
end 

def search_by_title(title)


    url_string = "https://www.boardgameatlas.com/api/search?name=" + title + "&client_id=OGh8WccUCc"
    response_string = RestClient.get(url_string)
    response_hash = JSON.parse(response_string)
end 

def game_info_array 

    info = ["name", "min_players", "max_players", "price", "min_playtime", "max_playtime", "reddit_all_time_count", "average_user_rating", "year_published"]
    return info 
end 


def get_game_info(game_hash)

    
    game_hash["games"].each do |game|

        #creates a new game object
        puts "*#{game}*"
        new_game = Game.create

        game_info_array.each do |info|

            #adds info about game to db 
            new_game[info] = game[info]
            new_game.save 
        end 
    end 
end 

#seed starts below:

get_game_info(search_by_title('Catan'))
get_game_info(search_by_title('Neuland'))
get_game_info(search_by_title('Dominion'))
get_game_info(search_by_title('Battle'))
get_game_info(search_by_title('Railroad'))
get_game_info(search_by_title('Bus'))
get_game_info(search_by_title('Campaign'))
get_game_info(search_by_title('Combat'))
get_game_info(search_by_title('18'))
get_game_info(search_by_title('1830'))
get_game_info(search_by_title('1817'))
get_game_info(search_by_title('Magic'))
get_game_info(search_by_title('Rails'))
get_game_info(search_by_title('Civilization'))

#User seed starts 

User.create(first_name: "John-Louis", last_name: "Rumingan")
User.create(first_name: "Samantha", last_name: "Smith")
User.create(first_name: "Sean", last_name: "Beach")
User.create(first_name: "Skyler", last_name: "Torian")
User.create(first_name: "Mansour", last_name: "Cheyo")
User.create(first_name: "Anna", last_name: "Dybas")
User.create(first_name: "Marija", last_name: "Stojanovic")
User.create(first_name: "Amia", last_name: "Defreitas")
