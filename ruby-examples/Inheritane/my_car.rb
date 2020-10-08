require_relative 'vehicule'

class MyCar < Vehicule
  NUMBER_OF_DOORS = 4

  def to_s
    "Car: #{@model} of color #{@color} form #{@year}"
  end
end
