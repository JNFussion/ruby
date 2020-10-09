require_relative 'node'

class Tree
  attr_accessor :root

  def initialize(arr)
    arr.sort!.uniq!
    @root = build_tree(arr)
  end

  def build_tree(arr)
    return nil if arr.empty?
    return Node.new(arr[0]) if arr.size == 1

    mid = arr.size / 2
    root = Node.new(arr[mid])

    root.left_child = build_tree(arr[0..mid - 1])
    root.right_child = build_tree(arr[mid + 1..-1])

    root
  end

  def insert(value, root = @root)
    return if find(value)
    return Node.new(value) if root.nil?

    if root.value < value
      root.left_child = insert(value, root.left_child)
    else
      root.right_child = insert(value, root.right_child)
    end

    root
  end

  def delete(value, root = @root)
    return root if root.nil?

    if value < root.value
      root.left_child = delete(value, root.left_child)
    elsif value > root.value
      root.right_child = delete(value, root.right_child)
    else
      return root.right_child if root.left_child.nil?
      return root.left_child if root.right_child.nil?

      root.value = min_value(root.right_child)

      root.right_child = delete(root.value, root.right_child)
    end
    root
  end

  def min_value(root)
    minv = root.value
    until root.left_child.nil?
      minv = root.left_child.value
      root = root.left_child
    end
    minv
  end

  def find(value, root = @root)
    return root if root.nil? || root.value == value

    root.value < value ? find(value, root.right_child) : find(value, root.left_child)
  end

  def level_order(root = @root)
    return if root.nil?

    queue = []
    data = []
    queue.unshift root

    until queue.empty?
      current = queue.last
      data << current.value
      queue.unshift current.left_child unless current.left_child.nil?
      queue.unshift current.right_child unless current.right_child.nil?
      queue.pop
    end
    data
  end

  def level_order_rec(root = @root, queue = [], data = [])
    return data if root.nil?

    data << root.value
    queue.unshift root.left_child if root.left_child
    queue.unshift root.right_child if root.right_child

    level_order_rec queue.pop, queue, data
  end

  def preorder(root = @root, data = [])
    return if root.nil?

    data << root.value
    data += preorder(root.left_child) if root.left_child
    data += preorder(root.right_child) if root.right_child

    data
  end

  def inorder(root = @root, data = [])
    return if root.nil?

    data += inorder(root.left_child) if root.left_child
    data << root.value
    data += inorder(root.right_child) if root.right_child

    data
  end

  def postorder(root = @root, data = [])
    return if root.nil?

    data += postorder(root.left_child) if root.left_child
    data += postorder(root.right_child) if root.right_child
    data << root.value

    data
  end

  def height(node = @root, height_left = 0, height_right = 0)

    height_left += height(node.left_child) + 1 if node.left_child
    height_right += height(node.right_child) + 1 if node.right_child

    height_left >= height_right ? height_left : height_right
  end

  def depth(node)
    current = @root
    depth = 0

    until current.nil?
      if current.value == node.value
        return depth
      elsif current.value < node.value
        depth += 1
        current = current.right_child
      else
        depth += 1
        current = current.left_child
      end
    end
  end

  def balanced?(node = @root, height_left = 0, height_right = 0)
    return true if node.nil?

    height_left = height(node.left_child) if node.left_child
    height_right = height(node.right_child) if node.right_child

    if (height_left - height_right).abs <= 1 && balanced?(node.left_child) && balanced?(node.right_child)
      return true
    end
    false
  end
  def rebalance
    return if balanced?

    data = level_order.sort!
    self.root = build_tree(data)
  end


  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
  end
end
