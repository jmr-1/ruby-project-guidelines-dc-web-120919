require 'rest-client'
require 'json'
require 'pry'

def get_games_api

    #make a web request
    #parse with JSON

    response_string = RestClient.get('https://www.boardgameatlas.com/api/search?name=Catan&client_id=OGh8WccUCc')
    response_hash = JSON.parse(response_string)
    return response_hash 
end 

puts get_games_api 

#add this data to db 