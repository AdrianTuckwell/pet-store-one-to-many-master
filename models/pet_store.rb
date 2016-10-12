require_relative('../db/sql_runner')

class PetStore

  attr_reader :id, :name, :address

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @address = options['address']
  end

  #------------- Create and Save Pet Stores ----------
  def save
    sql = "INSERT INTO pet_store (name, address) VALUES ('#{@name}', '#{@address}') RETURNING *"
    pet_store = SqlRunner.run(sql).first
    @id = pet_store['id'].to_i
  end

  #-------------- List all the pets of a store ------
  def list_of_pets
    sql = "SELECT * FROM pets WHERE pet_store_id = #{@id}"
    pets = SqlRunner.run(sql)
    result = pets.map { |pet| Pet.new(pet) }
    return result
  end

end