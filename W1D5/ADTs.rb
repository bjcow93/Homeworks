class Stack
  def initialize
    @stack = []
  end

  def push(el)
    @stack.push(el)
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
    @map = []
  end

  def set(key, value)
    pair_exist? == false
    index = nil

    @map.each_with_index do |pair, idx|
      if pair[0] == key
        pair_exist = true
        index = idx
      end

    if pair_exist?
      @map[idx][1] = value
    else
      @map.push([key, value])
    end
    
  end

  def get(key)
    @map.each {|pair| return pair[1] if pair[0] == key}
  end

  def delete(key)
    value = get(key)
    @map.reject! {|pair| pair[0] == key}
  end

  def show
    @map
  end
end
