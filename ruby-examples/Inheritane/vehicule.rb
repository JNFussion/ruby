class Vehicule
    attr_accessor :speed, :color
    attr_reader :year
  
    @@number_of_vehicule = 0
  
    def initialize(year, color, model)
      @year = year
      @color = color
      @model = model
      @speed = 0
      @@number_of_vehicule += 1
    end
  
    def speed_up(speed)
      self.speed += speed
    end
  
    def brake(speed)
      self.speed -= speed
    end
  
    def shut_down
      self.speed = 0
    end
  
    def spray_paint(paint)
      self.color = paint
    end
  
    def self.gas_mileage(litros, kilometres)
      kilometres / litros
    end
  
    def self.how_much_vehicule
      if @@number_of_vehicule <= 1
        puts "There is #{@@number_of_vehicule} vehicule"
      else
        puts "There are #{@@number_of_vehicule} vehicules"
      end
    end
  
    def to_s
      "Vehicule: #{@model} of color #{@color} form #{@year}"
    end
  
    def how_old_is
      puts "The age of the vehicule is #{age} years"
    end
  
    private
  
    def age
      Time.now.year - year
    end
  end