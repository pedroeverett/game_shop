require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/game.rb')
require_relative('../models/publisher.rb')


get '/games' do
  @games = Game.all()
  erb(:"games/index")
end

# get '/games/new' do
#   erb(:"games/new")
#   end