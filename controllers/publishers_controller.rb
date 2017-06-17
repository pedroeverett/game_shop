require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/game.rb')
require_relative('../models/publisher.rb')

#index
get '/publishers' do
  @publishers = Publisher.all()
  erb(:"publishers/index")
end

#new
get '/publishers/new' do
  erb(:"publishers/new")
end

#edit
get '/publishers/:id/edit' do
  @publishers = Publisher.find(params['id'].to_i())
  erb(:"publishers/edit")
end

#show
get '/publishers/:id' do
  @publishers = Publisher.find(params['id'].to_i())
  erb(:"publishers/info")
end

#save
post '/publishers' do
  publisher = Publisher.new(params)
  publisher.save()
  redirect to ("/publishers")
end

#delete
post '/publishers/:id/delete' do
  publisher = Publisher.find(params['id'].to_i())
  publisher.delete()
  redirect to("/publishers")
end