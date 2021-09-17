require_relative "code"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(code)
        exact_matches = @secret_code.num_exact_matches(code)
        near_matches = @secret_code.num_near_matches(code)
        puts "Exact matches: #{exact_matches}"
        puts "Near matches: #{near_matches}"
    end

    def ask_user_for_guess
        puts "Enter a code"
        code_str = gets.chomp
        code = Code.from_string(code_str)
        print_matches(code)
        code == @secret_code
    end
end
