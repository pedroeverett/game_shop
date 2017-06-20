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
Stock.delete_all()

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
  "publisher_id" => publisher1.id,
  "genre_id" =>  genre1.id,
  "url" => "/images/Doom_Cover.jpg"
  })
game1.save()

game2 = Game.new({
  "name" => "Wolfenstein: The Old Blood",
  "publisher_id" => publisher1.id,
  "genre_id" =>  genre1.id,
  "url" => "/images/Wolfenstein_The_Old_Blood_cover.jpg"
  })
game2.save()

game3 = Game.new({
  "name" => "Grand Theft Auto V",
  "publisher_id" => publisher2.id,
  "genre_id" =>  genre2.id,
  "url" => "/images/Grand_Theft_Auto_V.png"
  })
game3.save()

game4 = Game.new({
  "name" => "Rockstar Games Presents Table Tennis",
  "publisher_id" => publisher2.id,
  "genre_id" =>  genre3.id,
  "url" => "/images/Rockstar_Table_Tennis_Game_Cover.jpg"
  })
game4.save()

game5 = Game.new({
  "name" => "Burnout Paradise",
  "publisher_id" => publisher3.id,
  "genre_id" =>  genre4.id,
  "url" => "/images/Burnout_Paradise_Boxart.jpg"
  })
game5.save()

game6 = Game.new({
  "name" => "Battlefield Hardline",
  "publisher_id" => publisher3.id,
  "genre_id" =>  genre1.id,
  "url" => "/images/Battlefield_Hardline.jpg"
  })
game6.save()

game7 = Game.new({
  "name" => "2010 FIFA World Cup South Africa",
  "publisher_id" => publisher3.id,
  "genre_id" =>  genre4.id,
  "url" => "/images/fifa.jpg"
  })
game7.save()

platform1 = Platform.new({
  "name" => "Microsoft Windows"
  })
platform1.save()

platform2 = Platform.new({
  "name" => "XBox One"
  })
platform2.save()

platform3 = Platform.new({
  "name" => "PS3"
  })
platform3.save()

platform4 = Platform.new({
  "name" => "PS4"
  })
platform4.save()

platform5 = Platform.new({
  "name" => "Wii U"
  })
platform5.save()

stock1 = Stock.new({
  "game_id" => game1.id,
  "platform_id" => platform1.id,
  "quantity" => 10,
  "cost_price" => 10.20,
  "sell_price" => 12.20
  })
stock1.save()

stock2 = Stock.new({
  "game_id" => game1.id,
  "platform_id" => platform2.id,
  "quantity" => 4,
  "cost_price" => 11.20,
  "sell_price" => 14.20
  })
stock2.save()

stock3 = Stock.new({
  "game_id" => game1.id,
  "platform_id" => platform4.id,
  "quantity" => 3,
  "cost_price" => 9.20,
  "sell_price" => 13.20
  })
stock3.save()

stock4 = Stock.new({
  "game_id" => game2.id,
  "platform_id" => platform1.id,
  "quantity" => 2,
  "cost_price" => 10.20,
  "sell_price" => 12.20
  })
stock4.save()

stock5 = Stock.new({
  "game_id" => game2.id,
  "platform_id" => platform2.id,
  "quantity" => 7,
  "cost_price" => 11.50,
  "sell_price" => 13.70
  })
stock5.save()

stock6 = Stock.new({
  "game_id" => game2.id,
  "platform_id" => platform4.id,
  "quantity" => 10,
  "cost_price" => 9.80,
  "sell_price" => 13.70
  })
stock6.save()

stock7 = Stock.new({
  "game_id" => game3.id,
  "platform_id" => platform1.id,
  "quantity" => 8,
  "cost_price" => 12.80,
  "sell_price" => 19.70
  })
stock7.save()

stock8 = Stock.new({
  "game_id" => game3.id,
  "platform_id" => platform2.id,
  "quantity" => 4,
  "cost_price" => 10.80,
  "sell_price" => 16.70
  })
stock8.save()

stock9 = Stock.new({
  "game_id" => game3.id,
  "platform_id" => platform3.id,
  "quantity" => 6,
  "cost_price" => 9.50,
  "sell_price" => 15.20
  })
stock9.save()

stock10 = Stock.new({
  "game_id" => game3.id,
  "platform_id" => platform4.id,
  "quantity" => 15,
  "cost_price" => 11.80,
  "sell_price" => 22.70
  })
stock10.save()

stock11 = Stock.new({
  "game_id" => game4.id,
  "platform_id" => platform2.id,
  "quantity" => 8,
  "cost_price" => 6.40,
  "sell_price" => 10.70
  })
stock11.save()

stock12 = Stock.new({
  "game_id" => game4.id,
  "platform_id" => platform5.id,
  "quantity" => 20,
  "cost_price" => 12.40,
  "sell_price" => 20.70
  })
stock12.save()

stock13 = Stock.new({
  "game_id" => game5.id,
  "platform_id" => platform1.id,
  "quantity" => 6,
  "cost_price" => 11.40,
  "sell_price" => 16.70
  })
stock13.save()

stock14 = Stock.new({
  "game_id" => game5.id,
  "platform_id" => platform2.id,
  "quantity" => 2,
  "cost_price" => 8.40,
  "sell_price" => 12.10
  })
stock14.save()

stock14 = Stock.new({
  "game_id" => game5.id,
  "platform_id" => platform3.id,
  "quantity" => 1,
  "cost_price" => 10.40,
  "sell_price" => 13.70
  })
stock14.save()

stock15 = Stock.new({
  "game_id" => game6.id,
  "platform_id" => platform1.id,
  "quantity" => 1,
  "cost_price" => 6.40,
  "sell_price" => 10.70
  })
stock15.save()

stock16 = Stock.new({
  "game_id" => game6.id,
  "platform_id" => platform2.id,
  "quantity" => 8,
  "cost_price" => 7.20,
  "sell_price" => 10.30
  })
stock16.save()

stock17 = Stock.new({
  "game_id" => game6.id,
  "platform_id" => platform3.id,
  "quantity" => 7,
  "cost_price" => 8.20,
  "sell_price" => 12.30
  })
stock17.save()

stock18 = Stock.new({
  "game_id" => game6.id,
  "platform_id" => platform4.id,
  "quantity" => 10,
  "cost_price" => 9.60,
  "sell_price" => 13.70
  })
stock18.save()

stock19 = Stock.new({
  "game_id" => game7.id,
  "platform_id" => platform2.id,
  "quantity" => 5,
  "cost_price" => 5.80,
  "sell_price" => 8.70
  })
stock19.save()

stock20 = Stock.new({
  "game_id" => game7.id,
  "platform_id" => platform3.id,
  "quantity" => 4,
  "cost_price" => 4.80,
  "sell_price" => 8.20
  })
stock20.save()

stock21 = Stock.new({
  "game_id" => game7.id,
  "platform_id" => platform5.id,
  "quantity" => 4,
  "cost_price" => 8.80,
  "sell_price" => 12.70
  })
stock21.save()