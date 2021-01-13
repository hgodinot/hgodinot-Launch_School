class Element
  attr_reader :next, :datum
  
  def initialize(datum, nex = nil)
    @datum = datum
    @next = nex
  end
  
  def tail?
    !@next
  end
end

class SimpleLinkedList
  attr_reader :head, :size
  
  def self.from_a(arr)
    return SimpleLinkedList.new unless arr
    arr.reverse.each_with_object(SimpleLinkedList.new) do |val, result|
      result.push(val)
    end
  end
  
  def initialize
    @size = 0
  end
  
  def push(num)
    @head = Element.new(num, @head)
    @size += 1
  end
  
  def peek
    head ? head.datum : nil
  end
  
  def pop
    @size -= 1
    temp = head.datum
    @head = @head.next
    temp
  end
  
  def empty?
    !@head
  end
  
  def to_a
    copy = self
    [*0..size - 1].each_with_object([]) { |_,result| result << copy.pop }
  end
  
  def reverse
    SimpleLinkedList.from_a(self.to_a.reverse)
  end
end
