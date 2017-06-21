require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/game.rb')
require_relative('../models/publisher.rb')
require_relative('../models/genre.rb')

#index
get '/games' do
  @games = Game.all()
  erb(:"games/index")
end

#main index
get '/' do
  @games = Game.all_low()
  erb(:index)
end

#new
get '/games/new' do
  @publishers = Publisher.all()
  @genres = Genre.all()
  erb(:"games/new")
end

#edit
get '/games/:id/edit' do
  @games = Game.find(params['id'].to_i())
  @publishers = Publisher.all()
  @genres = Genre.all()
  erb(:"games/edit")
end

#show
get '/games/:id' do
  @games = Game.find(params['id'].to_i())
  erb(:"games/info")
end

#save
post '/games' do
  game = Game.new(params)
  game.save()
  redirect to("/games")
end

#delete
post '/games/:id/delete' do
  game = Game.find(params['id'].to_i())
  game.delete()
  redirect to("/games")
end

#update
post '/games/:id' do
  game = Game.new(params)
  game.update()
  redirect to("/games/#{params["id"]}")
end

