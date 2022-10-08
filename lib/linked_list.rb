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

  # Returns the index of the node containing value, or nil if not found
  def find(value)
    index = 0
    current_node = @head

    until current_node.nil?
      return index if current_node.value == value

      index += 1
      current_node = current_node.next_node
    end

    nil
  end

  # Represents LinkedList objects as strings, so they can be printed out and
  # previewed in the console with the format:
  # ( value ) -> ( value ) -> ( value ) -> nil
  def to_s
    current_node = @head
    string_output = ''

    until current_node.nil?
      string_output += "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end

    string_output += 'nil'
    string_output
  end

  # Inserts a new node with the provided value at the given index
  def insert_at(value, index)
    if index <= 0
      prepend(value)
    elsif index >= @size
      append(value)
    else
      current_node = @head

      (index - 1).times do
        current_node = current_node.next_node
      end

      previous_next_node = current_node.next_node

      new_node = Node.new
      new_node.value = value

      current_node.next_node = new_node
      new_node.next_node = previous_next_node
    end
  end

  # Removes the node at the given index
  def remove_at(index)
    if index <= 0
      @head = @head.next_node
    elsif index >= @size
      pop
    else
      current_node = @head

      (index - 1).times do
        current_node = current_node.next_node
      end

      node_to_delete = current_node.next_node
      new_next_node = node_to_delete.next_node

      current_node.next_node = new_next_node
    end
  end
end
