class Node
  include Comparable
  attr_accessor :value, :left_child, :right_child

  def initialize(value, _left_childr = nil, right_child = nil)
    @value = value
    @left_child = left_child
    @right_child = right_child
  end
end
