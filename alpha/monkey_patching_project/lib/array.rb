# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.empty?
    self.max - self.min
  end

  def average
    return nil if self.empty?
    self.sum / self.length.to_f
  end

  def median
    return nil if self.empty?
    sorted_arr = self.sort
    arr_len = sorted_arr.length
    mid = arr_len / 2
    arr_len.odd? ? sorted_arr[mid] :
        [sorted_arr[mid], sorted_arr[mid - 1]].average
  end

  def counts
    counts = Hash.new(0)
    self.each { |el| counts[el] += 1 }
    counts
  end

  def my_count(value)
    count = 0
    self.each { |el| count += 1 if el == value }
    count
  end

  def my_index(value)
    self.each_with_index { |el, i| return i if el == value }
    nil
  end

  def my_uniq
    counts = self.counts
    counts.keys
  end

  def my_transpose
    transposed = []
    (0...self.length).each do |row|
        subarr = []
        (0...self.length).each do |col|
            subarr << self[col][row]
        end
        transposed << subarr
    end
    transposed
  end
end
