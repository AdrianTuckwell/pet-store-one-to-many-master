require_relative('./models/pet_store')
require_relative('./models/pets')

require('pry-byebug')

pets_emporium = PetStore.new({'name' => 'Pets Emporium', 'address' => '123 Fake St'})
pets_emporium.save()

monkey_market = PetStore.new({'name' => 'Monkeys Market', 'address' => '789 Banana Grove'})
monkey_market.save()

pet1 = Pets.new({'name' => 'Dave', 'type' => 'Monkey', 'pet_store_id' => pets_emporium.id})
pet1.save()
pet2 = Pets.new({'name' => 'Maurice', 'type' => 'Monkey', 'pet_store_id' => pets_emporium.id})
pet2.save()
pet3 = Pets.new({'name' => 'Kev', 'type' => 'Dog', 'pet_store_id' => pets_emporium.id})
pet3.save()
pet4 = Pets.new({'name' => 'Timmy', 'type' => 'Snake', 'pet_store_id' => pets_emporium.id})
pet4.save()

pet5 = Pets.new({'name' => 'Steve', 'type' => 'Silverback', 'pet_store_id' => monkey_market.id})
pet5.save()
pet6 = Pets.new({'name' => 'Gordon', 'type' => 'Gorilla', 'pet_store_id' => monkey_market.id})
pet6.save()



binding.pry
nil