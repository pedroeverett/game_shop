require_relative('../db/sql_runner.rb')

class Game

  attr_accessor :name, :quantity, :publisher_id, :genre_id, :cost_price, :sell_price, :url
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @quantity = options['quantity'].to_i
    @publisher_id = options['publisher_id'].to_i
    @genre_id = options['genre_id'].to_i
    @cost_price = options['cost_price'].to_f
    @sell_price = options['sell_price'].to_f
    @url = options['url']
  end

  def save()
    sql = "INSERT INTO games (name, quantity, publisher_id, genre_id, cost_price, sell_price, url) VALUES ('#{@name}', #{@quantity}, #{@publisher_id}, #{@genre_id}, #{@cost_price}, #{@sell_price}, '#{@url}') RETURNING *"
    game = SqlRunner.run(sql)
    @id = game.first()['id'].to_i
  end

  def update()
    sql = "UPDATE games SET 
    name = '#{@name}',
    quantity = '#{@quantity}',
    publisher_id = '#{@publisher_id}',
    genre_id = '#{@genre_id}',
    cost_price = '#{@cost_price}',
    sell_price = '#{@sell_price}',
    url = '#{@url}'
    WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM games WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def publisher()
    sql = "SELECT publishers.* FROM publishers WHERE id = #{@publisher_id}"
    result = SqlRunner.run(sql)
    publisher_info = result[0]
    publisher = Publisher.new(publisher_info)
    return publisher.name
  end

  def genre()
    sql = "SELECT genres.* FROM genres WHERE id = #{@genre_id}"
    result = SqlRunner.run(sql)
    genre_info = result[0]
    genre = Genre.new(genre_info)
    return genre.name
  end

  def markup()
    margin = @sell_price - @cost_price
    markup = (margin * 100) / @cost_price
    return markup.to_f.round(2)
  end

  def color()
    if @quantity >= 5 
      result = "green"
    else
      result = "red"
    end
    return result.to_s
  end

  def image()
    if @url.empty?
      image = "/images/no_image.png"
    else
      image = @url
    end
    return image
  end

  def self.all()
    sql = "SELECT * FROM games ORDER BY name ASC"
    games = SqlRunner.run(sql)
    result = games.map{ |game| Game.new(game)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM games WHERE id = #{id}"
    game = SqlRunner.run(sql).first
    result = Game.new(game)
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM games"
    SqlRunner.run(sql)
  end
  
end