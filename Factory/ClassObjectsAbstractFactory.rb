require_relative 'Lib'

class OrganismFactory
  def initialize(animal_class, plant_class)
    @animal_class = animal_class
    @plant_class = plant_class 
  end

  def new_animal(name)
    return @animal_class.new(name)
  end

  def new_plant(name)
    return @plant_class.new(name)
  end
end

class Pond
  def initialize(number_of_animals, number_of_plants, factory)
    @animals = []
    number_of_animals.times do |i|
      animal = factory.new_animal("Animal #{i}")
      @animals << animal
    end
    
    @plants = []
    number_of_plants.times do |i|
      plant = factory.new_plant("Plant #{i}")
      @plants << plant
    end
  end

  def simulate_one_day
    @animals.each { |animal| puts(animal.eat) }
    @plants.each { |plant| puts(plant.grow) }
  end
end

pondOrganismFactory = OrganismFactory.new(Duck, WaterLily)
jungleOrganismFactory = OrganismFactory.new(Tiger, Tree)

pond1 = Pond.new(1, 2, pondOrganismFactory)
pond1.simulate_one_day

pond2 = Pond.new(2, 4, jungleOrganismFactory)
pond2.simulate_one_day
