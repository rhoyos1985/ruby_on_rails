# Homework Assignment: Area code dictionary - Text directions

# 1. Create a dictionary (hash) with 10 city names, where the city name would be a string and the key, and the area code would be the value
# 2. Display the city names to the user which are available in the dictionary
# 3. Get input from the user on the city name (hint: use gets.chomp method)
# 4. Display area code based on user's city choice
# 5. Loop - keep the program running and prompt the user for new city names to lookup
# 6. Method to look up area code, this will take in a hash of the dictionary and the city name and will output area code
# 7. Method to display just city names

city_code = {
    'cali' => "2122",
    'cartagena' => "3031",
    'choco' => "3041",
    'cucuta' => "3021",
    'medellin' => "1004",
    'monteria' => "1005",
    'pasto' => "2036",
    'pereira' => "5009",
    'quibdo' => "5038",
    'rioacha' => "6100",
}

def print_city(any_hash)
    a = 0
    puts "****************************************************************************"
    any_hash.each { |key,value| puts "*        #{a+=1}     -   #{key}              *"}
    puts "****************************************************************************"
end

def search_city_code(city_hash)
    
    var_city_code = city_hash

    print_city(var_city_code)

    loop do
        puts "Select the city what you know code area"
        city = gets.chomp
        
        if var_city_code.include?(city) 
            puts "The code's area for #{city} is #{var_city_code[city]}" 
            break
        else
            puts "Try Again!"
        end
    end
end

search_city_code(city_code)