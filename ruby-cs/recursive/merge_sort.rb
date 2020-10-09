def merge_sort(arr)
  return arr if arr.length <= 1

  left = []
  rigth = []
  arr.each_with_index { |value, index| index < arr.length / 2 ? left << value : rigth << value }
  left = merge_sort left
  rigth = merge_sort rigth
  merge(left, rigth)
end

def merge(left, rigth)
  result = []
  result << (left.first <= rigth.first ? left.shift : rigth.shift) until left.empty? || rigth.empty?
  result << left.shift until left.empty?
  result << rigth.shift until rigth.empty?
  result
end
a = (0..rand(1..200)).to_a.shuffle

puts 'Unsorted:'
puts a.to_s
puts
puts 'Sorted:'
puts merge_sort(a).to_s
