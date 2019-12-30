require 'rest-client'
require 'json'
require 'pry'
require 'pp'


def get_games_api

    #make a web request
    #parse with JSON

    response_string = RestClient.get('https://www.boardgameatlas.com/api/search?name=Catan&client_id=OGh8WccUCc')
    response_hash = JSON.parse(response_string)
    return response_hash 
end 


#get specific info from the hash
#return the info to make sure we are getting the correct info

def search_by_title(title)


    url_string = "https://www.boardgameatlas.com/api/search?name=" + title + "&client_id=OGh8WccUCc"
    response_string = RestClient.get(url_string)
    response_hash = JSON.parse(response_string)
end 

#test to pp a sample game 
pp search_by_title('1817')

def game_info_array 

    info = ["name", "min_players", "max_players", "price", "min_playtime", "max_playtime", "min_age", "reddit_all_time_count"]
    return info 
end 


def get_title(game_hash)

    
    game_hash["games"].each do |game|

        puts "****"
        new_game = Game.create

        game_info_array.each do |info|

            #new_game.info = game[info]
            puts game[info]
        end 
        puts "****"


    end 
end 

#test to get game data 

get_title(search_by_title('1817'))

#add this data to db 

