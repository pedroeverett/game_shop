require_relative('../db/sql_runner.rb')

class Game

  attr_reader :id, :name, :quantity, :publisher_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @quantity = options['quantity']
    @publisher_id = options['publisher_id'].to_i
  end

  def save()
    sql = "INSERT INTO games (name, quantity, publisher_id) VALUES ('#{@name}', #{@quantity}, '#{@publisher_id}') RETURNING *"
    game = SqlRunner.run(sql)
    @id = game.first()['id'].to_i
  end

  def publisher()
    sql = "SELECT publishers.* FROM publishers WHERE id = #{@publisher_id}"
    result = SqlRunner.run(sql)
    publisher_info = result[0]
    publisher = Publisher.new(publisher_info)
    return publisher.name
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



end