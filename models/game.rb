require_relative('../db/sql_runner.rb')

class Game

  attr_accessor :name, :publisher_id, :genre_id, :url
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @publisher_id = options['publisher_id'].to_i
    @genre_id = options['genre_id'].to_i
    @url = options['url']
  end

  def save()
    sql = "INSERT INTO games (name, publisher_id, genre_id, url) VALUES ('#{@name}', #{@publisher_id}, #{@genre_id}, '#{@url}') RETURNING *"
    game = SqlRunner.run(sql)
    @id = game.first()['id'].to_i
  end

  def update()
    sql = "UPDATE games SET 
    name = '#{@name}',
    publisher_id = '#{@publisher_id}',
    genre_id = '#{@genre_id}',
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

  def image()
    if @url.empty?
      image = "/images/no_image.png"
    else
      image = @url
    end
    return image
  end

  def self.all()
    sql = "SELECT * FROM games"
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