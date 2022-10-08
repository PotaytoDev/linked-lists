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
    return @head if index.zero?

    current = @head

    while index > 0
      current = current.next_node
      index -= 1
    end

    current
  end
end
