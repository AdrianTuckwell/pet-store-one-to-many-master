require_relative('../db/sql_runner')

class PetStore

  attr_reader :id
  attr_accessor :name, :address

  def initialize(options)
    @id = options['id'].to_i if options['id'] != nil
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

  #------------ Find Pet Stores by their ID ---------
  def find_by_id(id)
    sql = "SELECT * FROM pet_store WHERE id = #{id}"
    pet_store = SqlRunner.run(sql).first
    return pet_store
  end

  #------------ Edit Pet Stores ---------------------
  def update
    sql = "UPDATE pet_store SET 
      name = '#{ @name }',
      address = '#{ @address }'
      WHERE id = #{@id};"
    SqlRunner.run(sql)
    return nil
  end

  #------------ Delete Pet Stores -------------------
  def self.delete(id)
    sql = "DELETE FROM pet_store WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  #------------ List All Pet Stores -----------------
  def self.list
    sql = "SELECT * FROM pet_store"
    pet_stores = SqlRunner.run(sql)
    result = pet_stores.map { |store| PetStore.new(store)}
    return result
  end

end #--- PetStore end -----------------