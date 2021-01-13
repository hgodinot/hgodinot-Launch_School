class CircularBuffer
  def initialize(size)
    @buffer = Array.new(size)
  end
  
  def read
    raise BufferEmptyException if @buffer.all?(nil)
    @buffer.push(nil).shift
  end
  
  def clear
    @buffer.map! { |_| nil }
  end
  
  def write(num)
    return if !n #Optional, for no error when writing nil in a full buffer
    raise BufferFullException if @buffer.none?(nil)
    @buffer[@buffer.index(nil)] = num
  end
  
  def write!(n)
    @buffer.any?(nil) ? write(n) : @buffer = @buffer[1..-1].push(n) if n
  end
  
  class BufferEmptyException < Exception
    def message
      "Buffer is empty, can't read"
    end
  end
  
  class BufferFullException < Exception
    def message
      "Buffer is full, can't write"
    end
  end
end