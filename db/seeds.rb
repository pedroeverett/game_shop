require('pry-byebug')
require_relative('../models/game.rb')
require_relative('../models/publisher.rb')
require_relative('../models/genre.rb')
require_relative('../models/platform.rb')
require_relative('../models/stock.rb')

Publisher.delete_all()
Genre.delete_all()
Game.delete_all()
Platform.delete_all()
Stock.delete()

publisher1 = Publisher.new({
  "name" => "Bethesda Softworks",
  "address" => "1370 Piccard Drive",
  "city" => "Rockville",
  "country" => "USA",
  "post_code" => "MD 20850",
  "phone" => "0799 653 6432",
  "website" => "https://bethesda.net",
  "email" => "info@bethsoft.com"
  })
publisher1.save()

publisher2 = Publisher.new({
  "name" => "Rockstar Games",
  "address" => "Barclay House, 108 Holyrood Rd",
  "city" => "Edinburgh",
  "country" => "UK",
  "post_code" => "EH8 8AS",
  "phone" => "0800 953 6962",
  "website" => "http://www.rockstargames.com",
  "email" => "info@rockstargames.com"
  })
publisher2.save()

publisher3 = Publisher.new({
  "name" => "Electronic Arts",
  "address" => "Onslow House, Onslow St",
  "city" => "Guildford",
  "country" => "UK",
  "post_code" => "GU1 4TN",
  "phone" => "0123 765 2398",
  "website" => "https://www.ea.com",
  "email" => "info@ea.com"
  })
publisher3.save()

genre1 = Genre.new({
  "name" => "First-person shooter"
  })
genre1.save()

genre2 = Genre.new({
  "name" => "Action Adventure"
  })
genre2.save()

genre3 = Genre.new({
  "name" => "Sports"
  })
genre3.save()

genre4 = Genre.new({
  "name" => "Racing"
  })
genre4.save()

game1 = Game.new({
  "name" => "Doom",
  "quantity" => 10,
  "publisher_id" => publisher1.id,
  "genre_id" =>  genre1.id,
  "cost_price" =>  10.20,
  "sell_price" =>  15.55,
  "url" => "/images/Doom_Cover.jpg"
  })
game1.save()

game2 = Game.new({
  "name" => "Wolfenstein: The Old Blood",
  "quantity" => 5,
  "publisher_id" => publisher1.id,
  "genre_id" =>  genre1.id,
  "cost_price" =>  11.20,
  "sell_price" =>  16.15,
  "url" => "/images/Wolfenstein_The_Old_Blood_cover.jpg"
  })
game2.save()

game3 = Game.new({
  "name" => "Grand Theft Auto V",
  "quantity" => 20,
  "publisher_id" => publisher2.id,
  "genre_id" =>  genre2.id,
  "cost_price" =>  11.75,
  "sell_price" =>  20.30,
  "url" => "/images/Grand_Theft_Auto_V.png"
  })
game3.save()

game4 = Game.new({
  "name" => "Rockstar Games Presents Table Tennis",
  "quantity" => 2,
  "publisher_id" => publisher2.id,
  "genre_id" =>  genre3.id,
  "cost_price" =>  8.20,
  "sell_price" =>  14.00,
  "url" => "/images/Rockstar_Table_Tennis_Game_Cover.jpg"
  })
game4.save()

game5 = Game.new({
  "name" => "Burnout Paradise",
  "quantity" => 7,
  "publisher_id" => publisher3.id,
  "genre_id" =>  genre4.id,
  "cost_price" =>  3.20,
  "sell_price" =>  10.40,
  "url" => "/images/Burnout_Paradise_Boxart.jpg"
  })
game5.save()

game6 = Game.new({
  "name" => "Battlefield Hardline",
  "quantity" => 3,
  "publisher_id" => publisher3.id,
  "genre_id" =>  genre1.id,
  "cost_price" =>  7.20,
  "sell_price" =>  13.60,
  "url" => "/images/Battlefield_Hardline.jpg"
  })
game6.save()