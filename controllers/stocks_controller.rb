require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/game.rb')
require_relative('../models/publisher.rb')
require_relative('../models/genre.rb')
require_relative('../models/stock.rb')
require_relative('../models/plarform.rb')

#index
get '/stocks' do
  @stocks = Stock.all()
  erb(:"stocks/index")
end