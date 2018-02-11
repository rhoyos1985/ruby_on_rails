require 'json'

class User

    attr_accessor :name, :email, :permissions

    def initialize(*args) # *args => array of atributes can be access with args[index]
        @name = args[0]
        @email = args[1]
        @permissions = User.permissions_from_template
    end
    
    def save

        self_json = {email: @email, name: @name, permissions: @permissions}.to_json
        open('user.json','a') do |file|
            file.puts self_json
        end
        
    end

    def self.permissions_from_template
        file = File.read 'user_permissions_template.json'
        JSON.load(file, nil, symbolize_names: true)
    end

end