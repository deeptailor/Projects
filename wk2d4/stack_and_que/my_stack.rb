class MyStack

  def initialize(array = [])
    @store = array
  end

  def push(parameter)
    @store << parameter
  end

  def pop
    @store.pop
  end

  def peek
    @store.last
  end

  def size
    @store.count
  end

  def empty?
    @store.empty?
  end

end
