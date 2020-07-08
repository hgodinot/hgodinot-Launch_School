class CircularBuffer
  def initialize(max_size)
    @max_size = max_size
    @buffer = []
  end

  def read
    raise BufferEmptyException if buffer.empty?
    buffer.shift
  end

  def write(element)
    update_buffer(element) { raise BufferFullException }
  end

  def write!(element)
    update_buffer(element) { buffer.shift }
  end

  def clear
    self.buffer = []
  end

  private

  attr_accessor :buffer
  attr_reader :max_size

  def update_buffer(element)
    return if element.nil?
    yield if buffer.size == max_size
    buffer << element
  end

  class BufferEmptyException < Exception; end
  class BufferFullException < Exception; end
end









=begin
class CircularBuffer
  attr_accessor :buffer
  
  def initialize(size)
    @buffer = Array.new(size)
  end
  
  def read
    0.upto(buffer.size - 1) do |idx|
      if buffer[idx] != nil
        temp = buffer[idx]
        buffer.delete_at(idx)
        buffer.unshift(nil)
        return temp
      end
    end
    raise BufferEmptyException
  end
  
  def write(input)
    raise BufferFullException if buffer.first != nil
    buffer.shift
    buffer << input
  end

  def write!(input)
    return if input == nil
    deleted = false
    0.upto(buffer.size - 1) do |idx|
      if buffer[idx] == nil
        buffer.delete_at(idx)
        deleted = true
        break
      end
    end
    buffer.delete_at(0) unless deleted
    buffer << input
  end
  
  def clear
    self.buffer = buffer.map { |val| val = nil }
  end
  
  class BufferEmptyException < Exception; end
  class BufferFullException < Exception; end
end
=end