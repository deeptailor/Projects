require_relative 'my_stack'

class MyStackQue
  def initialize(array=[])
    @full_stack = MyStack.new(array)
    @empty_stack = MyStack.new
  end

  def enqeue(parameter)
    @full_stack.push(parameter)
  end

  def deqeue
    until @full_stack.empty?
      @empty_stack.push(@full_stack.pop)
    end
    target = @empty_stack.pop
    until @empty_stack.empty?
      @full_stack.push(@empty_stack.pop)
    end
    target
  end

  def peek
    @full_stack.peek
  end

  def size
    @full_stack.size
  end

  def empty?
    @full_stack.empty?
  end

end


# [1, 2, 3]
# => 1

# [1, 2, 3] << 4
# => [1, 2, 3, 4]
