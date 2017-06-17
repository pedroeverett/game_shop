require_relative('../db/sql_runner.rb')

class Publisher

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO publishers (name) VALUES ('#{@name}') RETURNING *"
    publisher = SqlRunner.run(sql)
    @id = publisher.first()['id'].to_i
  end

  def game()
    sql = "SELECT games.* FROM games WHERE id = #{@publisher_id}"
    games = SqlRunner.run(sql)
    game = games.map{ |game| Game.new(game)}
    return game
  end

  def self.all()
    sql = "SELECT * FROM publishers"
    publishers = SqlRunner.run(sql)
    result = publishers.map{ |publisher| Publisher.new(publisher)}
    return result
  end

end