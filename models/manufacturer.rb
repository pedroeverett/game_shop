require_relative('../db/sqlrunner.rb')

class Manufacturer

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

end