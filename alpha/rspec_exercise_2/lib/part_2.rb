def palindrome?(str)
    reversed_str = reverse_string(str)
    str == reversed_str
end

def reverse_string(str)
    return str if str.empty?
    str[-1] + reverse_string(str[0...-1])
end

def substrings(str)
    substrs = []
    (0...str.length).each do |start_pos|
        (start_pos...str.length).each do |end_pos|
            substrs << str[start_pos..end_pos]
        end
    end
    substrs
end

def palindrome_substrings(str)
    substrings = substrings(str)
    substrings.select { |str| str.length > 1 && palindrome?(str) }
end