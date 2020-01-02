#This can seed the database

require 'rest-client'
require 'json'
require 'pry'
require 'pp'
# require_relative '../config/environment'

#clean database first 
Game.destroy_all 
User.destroy_all
Collection.destroy_all 

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
        # puts "*#{game}*"
        new_game = Game.create

        game_info_array.each do |info|

            #adds info about game to db 
            new_game[info] = game[info]
            new_game.save 
        end 
    end 
end 

#seed starts below:
get_game_info(search_by_title('Neuland'))
get_game_info(search_by_title('Keyflower'))
get_game_info(search_by_title('Agricola'))
get_game_info(search_by_title('Dominion'))
get_game_info(search_by_title('Railroad'))
get_game_info(search_by_title('Maskmen'))
get_game_info(search_by_title('Azul'))
get_game_info(search_by_title('1830'))
get_game_info(search_by_title('1817'))
get_game_info(search_by_title('Automobile'))
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
User.create(first_name: "Dean", last_name: "Hildebrand")
User.create(first_name: "Jennifer", last_name: "Gomez")
User.create(first_name: "Shannon", last_name: "Nabors")
User.create(first_name: "Paul", last_name: "Nicholsen")
User.create(first_name: "JC", last_name: "Chang")

#collection seed here 

def collection_maker(user)

    #randomly add 100 games to each user's collection 
    100.times do
        
        #Collection.create(user_id: , game_id: )
        #Collection.create(user, Game.all[rand(Game.all.length)])
        game = Game.all[rand(Game.all.length)]

        Collection.create(user_id: user.id, game_id: game.id)
    end 

end 

def create_user_collection 

    User.all.each do |user|
        puts "creating collection for #{user.first_name} #{user.last_name}"
        collection_maker(user)
    end 
end 

create_user_collection  