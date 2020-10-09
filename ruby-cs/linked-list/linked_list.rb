require_relative 'node'

class LinkedList
  def initilize
    @head = nil
  end

  def append(value)
    return prepend(value) if @head.nil?

    temp = @head

    temp = temp.next_node until temp.next_node.nil?

    temp.next_node = Node.new(value)

    to_s
  end

  def prepend(value)
    @head = Node.new(value, @head)

    to_s
  end

  def size
    return 0 if @head.nil?

    sum = 0
    temp = @head

    until temp.nil?
      sum += 1
      temp = temp.next_node
    end

    sum
  end

  def head
    @head.value
  end

  def tail
    return if @head.nil?

    temp = @head
    temp = temp.next_node until temp.next_node.nil?

    temp.value
  end

  def at(index)
    return if @head.nil?
    return if index.negative? || index >= size

    i = 0
    temp = @head
    until temp.next_node.nil?
      return temp.value if i == index

      i += 1
      temp = temp.next_node
    end

    nil
  end

  def pop
    return if @head.nil?

    previous = nil
    current = @head

    until current.next_node.nil?
      previous = current
      current = current.next_node
    end
    previous.next_node = nil

    current.value
  end

  def contains?(value)
    return if @head.nil?

    temp = @head
    until temp.nil?
      return true if temp.value == value

      temp = temp.next_node
    end
    false
  end

  def find(value)
    return if @head.nil?

    temp = @head
    index = 0
    until temp.nil?
      return index if temp.value == value

      temp = temp.next_node
      index += 1
    end
    nil
  end

  def insert_at(value, index)
    return if index.negative? || index >= size

    return prepend(value) if index.zero? || @head.nil?
    return append(value) if index == size - 1

    i = 0
    previous = nil
    current = @head
    until current.next_node.nil?
      if i == index
        temp = current
        current = Node.new(value, temp)
        previous.next_node = current
      end
      i += 1
      previous = current
      current = current.next_node
    end
    to_s
  end

  def remove_at(index)
    return if index.negative? || index >= size
    return pop if index == size - 1

    if index.zero?
      removed = @head.value
      @head = @head.next_node
      return removed
    end

    i = 0
    previous = nil
    current = @head
    until current.next_node.nil?
      if i == index
        removed = current.value
        previous.next_node = current.next_node
        return removed
      end
      i += 1
      previous = current
      current = current.next_node
    end

    nil
  end

  def to_s
    return if @head.nil?

    result = ''
    temp = @head
    result = ''
    until temp.nil?
      result += "( #{temp.value} ) -> "
      temp = temp.next_node
    end
    result + 'nill'
  end
end
