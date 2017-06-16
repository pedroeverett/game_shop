require('pry-byebug')
require_relative('../models/game.rb')
require_relative('../models/publisher.rb')

publisher1 = Publisher.new({
  "name" => "Bethesda Softworks"
  })
publisher1.save()

publisher2 = Publisher.new({
  "name" => "Rockstar Games"
  })
publisher2.save()

publisher3 = Publisher.new({
  "name" => "Electronic Arts"
  })
publisher3.save()

game1 = Game.new({
  "name" => "Doom",
  "quantity" => 10,
  "publisher_id" => publisher1.id
  })
game1.save()

game2 = Game.new({
  "name" => "Wolfenstein: The Old Blood",
  "quantity" => 5,
  "publisher_id" => publisher1.id
  })
game2.save()

game3 = Game.new({
  "name" => "Grand Theft Auto V",
  "quantity" => 20,
  "publisher_id" => publisher2.id
  })
game3.save()

game4 = Game.new({
  "name" => "Rockstar Games Presents Table Tennis",
  "quantity" => 2,
  "publisher_id" => publisher2.id
  })
game4.save()

game5 = Game.new({
  "name" => "Burnout Paradise",
  "quantity" => 7,
  "publisher_id" => publisher3.id
  })
game5.save()

game6 = Game.new({
  "name" => "Dante's Inferno",
  "quantity" => 3,
  "publisher_id" => publisher3.id
  })
game6.save()