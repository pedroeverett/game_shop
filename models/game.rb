require_relative('../db/sqlrunner.rb')

class Game

  attr_reader :id, :name, :quantity, :manufacturer_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @quantity = options['quantity']
    @manufacturer_id = options['manufacturer_id'].to_i
  end

  def save()
    sql = "INSERT INTO games (name, quantity, manufacturer_id) VALUES ('#{@name}', '#{@quantity}', '#{@manufacturer_id}') RETURNING *"
    game = SqlRunner.run(sql)
    @id = game.first()['id'].to_i
  end

end