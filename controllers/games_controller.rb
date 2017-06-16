require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/game.rb')
require_relative('../models/publisher.rb')

#index
get '/games' do
  @games = Game.all()
  erb(:"games/index")
end

#new
get '/games/new' do
  @publishers = Publisher.all()
  erb(:"games/new")
  end

#show
get '/games/:id' do
  @games = Game.find(params['id'].to_i)
  erb(:"games/info")
end

#save
post '/games' do
  game = Game.new(params)
  game.save()
  redirect to ("/games")
end