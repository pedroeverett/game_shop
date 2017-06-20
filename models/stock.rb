require_relative('../db/sql_runner.rb')

class Stock

  attr_reader :id
  attr_accessor :game_id, :platform_id, :quantity, :cost_price, :sell_price

  def initialize(options)
    @id = options['id'].to_i
    @game_id = options['game_id'].to_i
    @platform_id = options['platform_id'].to_i
    @quantity = options['quantity'].to_i
    @cost_price = options['cost_price'].to_f
    @sell_price = options['sell_price'].to_f
  end


  def save()
    sql = "INSERT INTO stocks (game_id, platform_id, quantity, cost_price, sell_price) VALUES (#{@game_id}, #{@platform_id}, #{@quantity}, #{@cost_price}, #{@sell_price}) RETURNING *"
    stock = SqlRunner.run(sql)
    @id = stock.first()['id'].to_i
  end

  def update()
    sql = "UPDATE stocks SET
    game_id = '#{@game_id}',
    platform_id = '#{@platform_id}',
    quantity = '#{@quantity}',
    cost_price = '#{@cost_price}',
    sell_price = '#{@sell_price}'
    WHERE id = #{@id}
    "
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

  def self.delete_all()
    sql = "DELETE FROM stocks"
    SqlRunner.run(sql)
  end

end