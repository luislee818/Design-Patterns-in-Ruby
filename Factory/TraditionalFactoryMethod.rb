require_relative 'Lib'

class Pond
  def initialize(number_of_animals, number_of_plants)
    @animals = []
    number_of_animals.times do |i|
      animal = new_animal("Animal #{i}")
      @animals << animal
    end
    
    @plants = []
    number_of_plants.times do |i|
      plant = new_plant("Plant #{i}")
      @plants << plant
    end
  end

  def simulate_one_day
    @animals.each { |animal| puts(animal.eat) }
    @plants.each { |plant| puts(plant.grow) }
  end
end

class DuckWaterLilyPond < Pond
    def new_animal(name)
      return Duck.new(name)
    end

    def new_plant(name)
      return WaterLily.new(name)
    end
end

class FrogAlgaePond < Pond
    def new_animal(name)
      return Frog.new(name)
    end

    def new_plant(name)
      return Algae.new(name)
    end
end

pond1 = DuckWaterLilyPond.new(1, 2)
pond1.simulate_one_day

pond2 = FrogAlgaePond.new(2, 4)
pond2.simulate_one_day


