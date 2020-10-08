require_relative 'linked_list'


list = LinkedList.new

30.times do |num|
    list.append num
end

puts "append:"
puts list.to_s


puts "prepend 1: "
puts list.prepend 1

puts 'append 100: '
puts list.append 100

puts 'size: '
puts list.size

puts 'head'
puts list.head

puts 'tail'
puts list.tail

puts 'at(10)'
puts list.at 10

puts 'at(100)'
puts list.at 100

puts 'pop'
puts list.pop

puts 'list: '
puts list.to_s

puts 'contains 100'
puts list.contains? 100

puts 'contains 10'
puts list.contains? 10


puts 'find 100'
puts list.find 100


puts 'find 10'
puts list.find 10

puts 'Insert 666 at 1'
puts list.insert_at(666, 1)

puts 'Insert 666 at 100'
puts list.insert_at(666, 100)

puts 'Insert 666 at -10'
puts list.insert_at(666, -10)

puts 'Insert 666 at 0'
puts list.insert_at(666, 0)

puts "Insert 666 at #{list.size - 1}"
puts list.insert_at(666, list.size-1)

puts "Remove at  0"
puts list.remove_at 0

puts "Remove at #{list.size - 1}"
puts list.remove_at(list.size-1)

puts "Remove at 10"
puts list.remove_at 10
