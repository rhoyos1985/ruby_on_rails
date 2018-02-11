require 'pp'
require_relative 'user'

user = User.new 'Monica', 'monica@example.com'
pp user
user.save