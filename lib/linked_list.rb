class Node
  attr_accessor :value, :next_node

  def initialize
    @value = nil
    @next_node = nil
  end
end

class LinkedList
  attr_reader :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    new_node = Node.new
    new_node.value = value

    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      @tail.next_node = new_node
      @tail = @tail.next_node
    end

    @size += 1
  end

  def prepend(value)
    new_node = Node.new
    new_node.value = value

    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      new_node.next_node = @head
      @head = new_node
    end

    @size += 1
  end

  # Returns the node at the given index
  def at(index)
    return nil if index.negative? || index >= @size

    current_node = @head

    while index > 0
      current_node = current_node.next_node
      index -= 1
    end

    current_node
  end

  # Removes the last element from the list
  def pop
    current_node = @head

    until current_node.next_node == @tail
      current_node = current_node.next_node
    end

    @tail = current_node
    @tail.next_node = nil
    @size -= 1
  end

  # Returns true if the passed in value is in the list and otherwise returns false
  def contains?(value)
    current_node = @head

    until current_node.nil?
      return true if current_node.value == value

      current_node = current_node.next_node
    end

    false
  end
end
