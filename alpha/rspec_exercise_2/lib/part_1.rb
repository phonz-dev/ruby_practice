def partition(arr, num_arg)
    lesser = []
    greater = []

    arr.each do |num|
        if num >= num_arg
            greater << num
        else
            lesser << num
        end
    end

    [lesser, greater]
end

def merge(hash_1, hash_2)
    hash_1.merge(hash_2)
end

def censor(sentence, curse_words)
    words = sentence.split
    new_words = words.map do |word|
        if curse_words.include?(word.downcase)
            star_vowels(word)
        else
            word
        end
    end
    new_words.join(' ')
end

def star_vowels(word)
    vowels = 'aeiou'
    new_word = ''
    word.each_char do |ch|
        if vowels.include?(ch.downcase)
            new_word += '*'
        else
            new_word += ch
        end
    end
    new_word
end

def power_of_two?(num)
    initial_num = 1
    until initial_num == num
        return false if initial_num > num
        initial_num *= 2
    end
    true
end