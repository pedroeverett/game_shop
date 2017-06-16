require('pry-byebug')
require_relative('../models/game.rb')
require_relative('../models/publisher.rb')

publisher1 = Publisher.new({
  "name" => "Bethesda Softworks"
  })