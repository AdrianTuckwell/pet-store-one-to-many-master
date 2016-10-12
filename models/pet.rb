require_relative('../db/sql_runner')

class Pet

  attr_reader :id, :pet_store_id
  attr_accessor :name, :type 

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @type = options['type']
    @pet_store_id = options['pet_store_id'].to_i
  end

  #-------------- Create and Save Pets -----------------
  def save
    sql = "INSERT INTO pets (name, type, pet_store_id) VALUES ('#{@name}', '#{@type}', #{@pet_store_id}) RETURNING *"
    pet = SqlRunner.run(sql).first
    @id = pet ['id'].to_i
  end 

  #--------------- Show the store a pet belongs to ------
  def belongs_to
    sql = "SELECT * FROM pet_store WHERE id = #{@pet_store_id}"
    pet_store = SqlRunner.run(sql).first
    return PetStore.new(pet_store)
  end

  #--------------- Find Pets by their ID -----------------
  def pet_by_id
    sql = "SELECT * FROM pet_store WHERE id = #{@id}"
    pet_store = SqlRunner.run(sql).first
    return PetStore.new(pet_store)
  end

  #--------------- Edit Pets -----------------------------
  def update
      sql = "UPDATE pets SET 
        name = '#{ @name }',
        type = '#{ @type }'
        WHERE id = #{@id};"
      SqlRunner.run(sql)
      return nil
    end

  #--------------- Delete Pets ---------------------------
  def self.delete(id)
    sql = "DELETE FROM pets WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  #--------------- List All Pets -------------------------
  def self.list
    sql = "SELECT * FROM pets"
    pets = SqlRunner.run(sql)
    result = pets.map { |pet| Pet.new(pet)}
    return result
  end

end #--- PetStore end -----------------