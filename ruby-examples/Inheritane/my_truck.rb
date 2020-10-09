require_relative 'towable'

class MyTruck < Vehicule
  include Towable

  NUMBER_OF_DOORS = 2

  def to_s
    "Truck: #{@model} of color #{@color} form #{@year}"
  end
end
