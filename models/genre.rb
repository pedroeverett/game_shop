require_relative('../db/sql_runner.rb')

class Genre

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO genres (name)  VALUES ('#{@name}') RETURNING *"
    genre = SqlRunner.run(sql)
    @id = genre.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM genres ORDER BY name ASC"
    genres = SqlRunner.run(sql)
    result = genres.map{ |genre| Genre.new(genre)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM genres"
    SqlRunner.run(sql)
  end

end