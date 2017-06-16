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

  def self.all()
    sql = "SELECT * FROM publishers"
    publishers = SqlRunner.run(sql)
    result = publishers.map{ |publisher| Publisher.new(publisher)}
    return result
  end

end