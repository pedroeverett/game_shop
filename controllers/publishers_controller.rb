require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/game.rb')
require_relative('../models/publisher.rb')

get '/publishers' do
  erb(:"publishers/index")
end