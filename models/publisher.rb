require_relative('../db/sqlrunner.rb')

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

end