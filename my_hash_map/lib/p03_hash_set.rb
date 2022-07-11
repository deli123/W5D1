class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !self.include?(key)
      self[key] << key
      @count += 1
    end
    if @count > num_buckets
      resize!
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if self.include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    i = num.hash % num_buckets
    @store[i]
  end

  def num_buckets
    @store.length
  end

  def resize!
     new_buckets = num_buckets * 2
     new_arr = Array.new(new_buckets) { Array.new }
     @store.flatten.each {|ele| new_arr << ele}
     @store = new_arr
  end
end
