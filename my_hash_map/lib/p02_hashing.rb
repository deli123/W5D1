class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    return 1 if self.empty?
    new_arr = []
    self.each_with_index do |ele, i|
      new_arr << ele.hash + i.hash
    end
    new_arr.sum % new_arr[self.length % self.last]
  end
end

class String
  def hash
    new_arr = []
    self.each_char.with_index do |ele, i|
      # new_arr << alphabet.index(ele)
      new_arr << ele.ord
    end
    new_arr.sum % new_arr.last
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sum = 0
    self.each do |k, v|
      sum += k.hash + v.hash
    end
    sum
  end
end
