def select_even_nums(nums)
    nums.select { |num| num.even? }
end

def reject_puppies(dog_profiles)
    dog_profiles.reject { |dog| dog['age'] <= 2 }
end

def count_positive_subarrays(arr)
    arr.count { |subarr| subarr.sum > 0 }
end

def aba_translate(str)
    vowels = 'aeiou'
    new_str = ''
    str.each_char do |ch|
        if vowels.include?(ch)
            new_str += ch + 'b' + ch
        else
            new_str += ch
        end
    end
    new_str
end

def aba_array(words)
    words.map { |word| aba_translate(word) }
end