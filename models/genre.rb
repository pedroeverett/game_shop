require_relative('../db/sqlrunner.rb')

class Genre

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name'].to_i
  end

  def save()
    sql = "INSERT INTO genres (name)  VALUES ('#{@name}') RETURNING *"
    genre = SqlRunner.run(sql)
    @id = genre.first()['id'].to_i
  end

end