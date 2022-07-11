class MaxIntSet
  attr_reader :store, :max

  def initialize(max)
    @max = max
    @store = Array.new(max)
  end

  def insert(num)
    raise "Out of bounds" if num < 0 or num > @max
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    i = num % num_buckets
    @store[i]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !self.include?(num)
      self[num] << num
      @count+=1
    end
    if @count > num_buckets
      resize!
    end
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
   i = num % num_buckets
   @store[i]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_buckets = 2 * num_buckets 
    elements = @store.flatten
    @store = Array.new(new_buckets) { Array.new }
    elements.each do |ele|
      @store[ele] << ele
    end
  end
end
