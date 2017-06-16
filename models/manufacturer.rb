require_relative('../db/sqlrunner.rb')

class Manufacturer

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO manufacturers (name) VALUES ('#{@name}') RETURNING *"
    manufacturer = SqlRunner.run(sql)
    @id = manufacturer.first()['id'].to_i
  end

end