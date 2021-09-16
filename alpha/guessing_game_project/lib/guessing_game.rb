class GuessingGame
    attr_reader :num_attempts
    def initialize(min, max)
        @secret_num, @num_attempts, @game_over = rand(min..max), 0, false
    end

    def game_over?
        @game_over
    end

    def check_num(num)
        @num_attempts += 1
        if num == @secret_num
            puts("you win!")
            @game_over = true
        elsif num > @secret_num
            puts("too big")
        else
            puts("too small")
        end
    end

    def ask_user
        puts("enter a number\n")
        num = gets.chomp.to_i
        check_num(num)
    end
end
