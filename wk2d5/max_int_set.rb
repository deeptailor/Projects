class MaxIntSet
  def initialize(max)
    @store = Array.new(max+1){false}
    @max = max
  end

  def insert(el)
    error(el)

    @store[el] = true
  end

  def remove(el)
    error(el)

    @store[el] = false
  end

  def include?(el)
    error(el)

    @store[el] == true
  end

  private

  def error(el)
    raise if el > max
  end
end
