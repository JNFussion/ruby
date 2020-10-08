require_relative 'node'

class Tree
    
    def initialize(arr)
        arr.sort!.uniq!
        @root = build_tree(arr)
    end

    def build_tree(arr)
        return nil if arr.size == 0
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
            root.left_child = self.insert(value, root.left_child)
        else
            root.right_child = self.insert(value, root.right_child)
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
            if root.left_child.nil?
                return root.right_child
            elsif root.right_child.nil?
                return root.left_child
            end

            root.value = minValue(root.right_child)

            root.right_child = delete(root.value, root.right_child)
        end
        root
    end

    def minValue(root)
        minv = root.value
        while root.left_child != nil
            minv = root.left_child.value
            root = root.left_child
        end
        minv
    end

    def find(value, root = @root)
        return root if root.nil? || root.value == value
        
        root.value < value ? self.find(value, root.right_child) : self.find(value, root.left_child)
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


    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
        pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
    end
end

data = (1..7).to_a
#data = Array.new(20){1..100)}

tree = Tree.new(data)
tree.pretty_print
