require_relative('./models/pet_store')
require_relative('./models/pet')

require('pry-byebug')

#-------------- Pets Emporium object -----------------
pets_emporium = PetStore.new({'name' => 'Pets Emporium', 'address' => '123 Fake St'})
pets_emporium.save()

#-------------- New pet objects for Pets Emporium ----
pet1 = Pet.new({'name' => 'Dave', 'type' => 'Monkey', 'pet_store_id' => pets_emporium.id})
pet1.save()
pet2 = Pet.new({'name' => 'Maurice', 'type' => 'Monkey', 'pet_store_id' => pets_emporium.id})
pet2.save()
pet3 = Pet.new({'name' => 'Kev', 'type' => 'Dog', 'pet_store_id' => pets_emporium.id})
pet3.save()
pet4 = Pet.new({'name' => 'Timmy', 'type' => 'Snake', 'pet_store_id' => pets_emporium.id})
pet4.save()

#-------------- Monkey Market ------------------------
monkey_market = PetStore.new({'name' => 'Monkeys Market', 'address' => '789 Banana Grove'})
monkey_market.save()

#-------------- New pet objects for Monkey Market ----
pet5 = Pet.new({'name' => 'Steve', 'type' => 'Silverback', 'pet_store_id' => monkey_market.id})
pet5.save()
pet6 = Pet.new({'name' => 'Gordon', 'type' => 'Gorilla', 'pet_store_id' => monkey_market.id})
pet6.save()

#-----------------------------------------------------
binding.pry
nil