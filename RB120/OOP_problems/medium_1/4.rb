class CircularQueue
  def initialize(max_size)
    @array = Array.new(max_size)
  end
  
  def enqueue(element)
    @array.shift
    @array.push(element)
  end
  
  def dequeue
    0.upto(@array.size - 1) do |idx|
      if @array[idx] != nil
        @array.unshift(nil)
        return @array.delete_at(idx + 1)
      end
    end
  nil
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

=begin
  if array[-1] == nil
      array[-1] = element
    elsif array.count(nil) > 0
      array.push(element)
    else
      array.shift
      array.push(element)
      
  end
=end