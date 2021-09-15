def hipsterfy(word)
    vowels = "aeiou"
    (word.length - 1).downto(0) do |i|
        if vowels.include?(word[i])
            word[i] = ''
            break
        end
    end
    word
end

def vowel_counts(str)
    vowels = 'aeiou'
    counts = Hash.new(0)
    str.each_char { |ch| counts[ch.downcase] += 1 if vowels.include?(ch.downcase) }
    counts
end

def caesar_cipher(message, num)
    alpha = ('a'..'z').to_a
    new_msg = ''
    message.each_char do |ch|
        if alpha.include?(ch)
            new_idx = (alpha.index(ch) + num) % alpha.length
            new_msg += alpha[new_idx]
        else
            new_msg += ch
        end
    end
    new_msg
end