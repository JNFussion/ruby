
# Node of a LinkedList. Each node has itself a value, and points to the next node

class Node
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
