class LinkedList
  require_relative('node.rb')

  attr_reader :size, :head, :tail

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    # Create new node object
    new_node = Node.new(value)
    # If linked list is empty, set new node as head
    if @size.zero?
      @head = new_node
    else
      # Set current tail's next_node to the new node
      @tail.next_node = new_node
    end
    # Set new node as tail
    @tail = new_node
    @size += 1
  end

  def prepend(value)
    # Create new node object as head, where next_node is the current head
    @head = Node.new(value, @head)
    # If linked list is empty, set new node as tail
    @tail || @tail = @head
    @size += 1
  end

  def at(index)
    return "Your index must be between 0 and #{@size - 1}." unless index.between?(0, @size - 1)

    pointer = @head
    index.times do
      pointer = pointer.next_node
    end
    pointer.value
  end

  def pop
    return 'No items in list to remove.' if @size.zero?

    pointer = @head
    until pointer.next_node == @tail
      pointer = pointer.next_node
    end
    @tail = pointer
    @tail.next_node = nil
    @size -= 1
  end

  def contains?(value)
    (0..@size).include?(find(value))
  end

  def find(value)
    pointer = @head
    @size.times do |index|
      return index if pointer.value == value

      pointer = pointer.next_node
    end
    puts "List does not contain #{value}."
  end

  def to_s
    pointer = @head
    ary = []
    @size.times do
      ary << "( #{pointer.value} ) --> "
      pointer = pointer.next_node
    end
    ary << 'nil'
    ary.join(' ')
  end
end
