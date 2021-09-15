# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require 'set'

def largest_prime_factor(num)
    factors = get_factors(num)
    reversed = factors.reverse
    reversed.each { |fact| return fact if prime?(fact) }
    nil
end

def get_factors(num)
    (1..num).select { |fact| num % fact == 0 }
end

def prime?(num)
    return false if num < 2
    (2...num).each do |i|
        return false if num % i == 0
    end
    true
end

def unique_chars?(str)
    char_counts = Hash.new(0)
    str.each_char { |ch| char_counts[ch] += 1 }
    char_counts.values.none? { |val| val > 1 }
end

def dupe_indices(arr)
    char_indices = Hash.new { |h, k| h[k] = [] }
    arr.each_with_index { |el, i| char_indices[el] << i }
    char_indices.select { |k, v| v.length > 1 }
end

def ana_array(arr_1, arr_2)
    counts_1 = element_counts(arr_1)
    counts_2 = element_counts(arr_2)
    counts_1 == counts_2
end

def element_counts(arr)
    counts = Hash.new(0)
    arr.each { |el| counts[el] += 1 }
    counts
end