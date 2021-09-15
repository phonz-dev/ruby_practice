def reverser(str, &prc)
    reversed_str = str.reverse
    prc.call(reversed_str)
end

def word_changer(sentence, &prc)
    words = sentence.split
    new_words = words.map { |word| prc.call(word) }
    new_words.join(' ')
end

def greater_proc_value(num, prc_1, prc_2)
    result_1 = prc_1.call(num)
    result_2 = prc_2.call(num)
    result_1 > result_2 ? result_1 : result_2
end

def and_selector(arr, prc_1, prc_2)
    arr.select { |el| prc_1.call(el) && prc_2.call(el) }
end

def alternating_mapper(arr, prc_1, prc_2)
    arr.map.with_index do |el, i|
        i.even? ? prc_1.call(el) : prc_2.call(el)
    end
end