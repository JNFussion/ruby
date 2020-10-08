require_relative 'my_car'
require_relative 'my_truck'

car = MyCar.new(2015, 'red', 'audi')
car.speed_up(20)
puts car.speed
car.speed_up(20)
puts car.speed
car.brake(20)
puts car.speed
car.brake(20)
puts car.speed
car.shut_down
puts car.speed
puts MyCar.gas_mileage(13, 351)
car.how_old_is
puts car

truck = MyTruck.new(2010, 'grey', 'ford')
puts truck.can_tow?(1500)

Vehicule.how_much_vehicule

puts MyCar.ancestors
puts
puts MyTruck.ancestors
puts
puts Vehicule.ancestors
