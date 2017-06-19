require_relative('../db/sql_runner.rb')

class Publisher

  attr_accessor :name, :address, :city, :country, :post_code, :phone, :website, :email
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @address = options['address']
    @city = options['city']
    @country = options['country']
    @post_code = options['post_code']
    @phone = options['phone']
    @website = options['website']
    @email = options['email']
  end

  def save()
    sql = "INSERT INTO publishers (name, address, city, country, post_code, phone, website, email) VALUES ('#{@name}', '#{@address}', '#{@city}', '#{@country}', '#{@post_code}', '#{@phone}', '#{@website}', '#{@email}') RETURNING *"
    publisher = SqlRunner.run(sql)
    @id = publisher.first()['id'].to_i
  end

  def update()
    sql = "UPDATE publishers SET
          name = '#{@name}',
          address= '#{@address}', 
          city = '#{@city}', 
          country = '#{@country}', 
          post_code = '#{@post_code}', 
          phone = '#{@phone}', 
          website = '#{@website}', 
          email = '#{@email}'
          WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM publishers WHERE id = #{@id}"
    SqlRunner.run(sql)
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

  def self.find(id)
    sql = "SELECT * FROM publishers WHERE id = #{id}"
    publisher = SqlRunner.run(sql).first
    result = Publisher.new(publisher)
    return result
  end


end