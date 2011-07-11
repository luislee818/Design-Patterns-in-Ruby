require_relative 'Lib'

class Pond
  def initialize(number_of_animals, animal_class,
		 number_of_plants, plant_class)
    @animals = []
    number_of_animals.times do |i|
      animal = animal_class.new("Animal #{i}")
      @animals << animal
    end
    
    @plants = []
    number_of_plants.times do |i|
      plant = plant_class.new("Plant #{i}")
      @plants << plant
    end
  end

  def simulate_one_day
    @animals.each { |animal| puts(animal.eat) }
    @plants.each { |plant| puts(plant.grow) }
  end
end

pond1 = Pond.new(1, Duck, 2, WaterLily)
pond1.simulate_one_day

pond2 = Pond.new(2, Frog, 4, Algae)
pond2.simulate_one_day
