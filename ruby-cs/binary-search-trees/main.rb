require_relative 'tree'

numbers = Array.new(15){ rand(1..100)}
tree = Tree.new(numbers)

puts 'Tree:'
puts tree.pretty_print

puts "Balanced?"
puts tree.balanced?

puts 'Level order:'
puts "#{tree.level_order}"

puts 'Preorder:'
puts "#{tree.preorder}"

puts 'Postorder'
puts "#{tree.postorder}"

puts 'Inorder'
puts "#{tree.inorder}"

tree.insert(110)
tree.insert(120)
tree.insert(130)
tree.insert(140)
tree.insert(150)

puts 'Balanced?'
puts tree.balanced?

puts 'rebalancing tree'
tree.rebalance

puts 'Balanded?'
puts tree.balanced?

puts 'Tree:'
tree.pretty_print

puts 'Level order:'
puts "#{tree.level_order}"

puts 'Preorder:'
puts "#{tree.preorder}"

puts 'Postorder'
puts "#{tree.postorder}"

puts 'Inorder'
puts "#{tree.inorder}"