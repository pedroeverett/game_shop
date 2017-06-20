require_relative('../db/sql_runner.rb')

class Platform

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO platforms (name) VALUES ('#{@name}') RETURNING *"
    platform = SqlRunner.run(sql)
    @id = platform.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM platforms"
    SqlRunner.run(sql)
  end
end