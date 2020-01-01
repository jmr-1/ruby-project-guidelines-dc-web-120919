def greeting 

    puts " BOARD GAMES \n
    BOARD GAMES \n
        BOARD GAMES \n
            BOARD GAMES \n
                BOARD GAMES \n"
end 

def get_input

    return gets.strip.downcase
end 

def invalid_command 

    puts "Invalid input. Please try again. \n"
end 

def exit_program

    puts "Exiting program. Goodbye!"
end 

def user_login 

    puts "User login:"
    #user enters login info
    #if login info does not match any users, asks again
    #once login info returns something, returns that user 

    loop do 

        input = get_input 

        
        #splits the name into first and last 
        split = input.gsub(/\s+/m, ' ').gsub(/^\s+|\s+$/m, '').split(" ")
        puts split.first 
        puts split.last 
        user = User.where('lower(first_name) = ?', split.first) && User.where('lower(last_name) = ?', split.last)
        #puts "User: #{user}. Name: #{user.first_name} #{user.last_name}"
        puts "User: #{user}"
        break 
    end 
    
    # return user 
end 

def user_logout(user = nil) #changes login to nil and purges logged user object 

    user = nil 
    
end 