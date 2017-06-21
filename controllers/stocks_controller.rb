require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/game.rb')
require_relative('../models/publisher.rb')
require_relative('../models/genre.rb')
require_relative('../models/stock.rb')
require_relative('../models/platform.rb')

#index
get '/stocks' do
  @stocks = Stock.all()
  erb(:"stocks/index")
end

#main index
get '/' do
  @stocks = Stock.all_low()
  erb(:index)
end

#edit
get '/stocks/:id/edit' do
  @stock = Stock.find(params['id'].to_i())
  erb(:"stocks/edit")
end

#update
post '/stocks/:id' do
  stock = Stock.new(params)
  stock.update()
  redirect to("/stocks")
end