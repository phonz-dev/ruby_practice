def all_words_capitalized?(words)
    words.all? { |word| word == word.capitalize }
end

def no_valid_url?(urls)
    domain_names = ['.com', '.net', '.io', '.org']
    urls.none? { |url| domain_names.any? { |name| url.end_with?(name) } }
end

def any_passing_students?(students)
    students.any? do |student| 
        ave_grade = get_average(student[:grades])
        ave_grade >= 75
    end
end

def get_average(arr)
    arr.sum / arr.length.to_f
end