require_relative 'Lib'

class PondOrganismFactory
  def new_animal(name)
    return Duck.new(name)
  end

  def new_plant(name)
    return WaterLily.new(name)
  end
end

class JungleOrganismFactory
  def new_animal(name)
    return Tiger.new(name)
  end

  def new_plant(name)
    return Tree.new(name)
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

pond1 = Pond.new(1, 2, PondOrganismFactory.new)
pond1.simulate_one_day

pond2 = Pond.new(2, 4, JungleOrganismFactory.new)
pond2.simulate_one_day
