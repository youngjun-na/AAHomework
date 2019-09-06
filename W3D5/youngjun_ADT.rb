require "byebug"
class Stack
  def initialize
    @stack = []
  end

  def push(el)
    @stack.push(el)
    el
  end

  def pop
    @stack.pop
  end

  def peek
    @stack.last
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.push(el)
    el
  end
  
  def dequeue
    @queue.shift
  end

  def peek
    @queue.first
  end

end

class Map
  def initialize
    @mapped = []
  end

  def set(key, value)
    @mapped.each_with_index do |el, i|
      if el[0] == key
        el[1] = value
        return value
      end
    end
    @mapped.push([key, value])
    return value
  end

  def get(key)
    @mapped.each {|pair| return pair[1] if pair[0] == key}
    return nil
  end

  def delete(key)
    @mapped.select {|pair| pair[0] != key} 
  end
  
  def show
    @mapped
  end

end