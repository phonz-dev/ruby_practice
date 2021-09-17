require_relative "board"
require_relative "player"

class Battleship
    attr_reader :player, :board
    def initialize(board_len)
        @player = Player.new
        @board = Board.new(board_len)
        @remaining_misses = @board.size / 2
    end

    def start_game
        board.place_random_ships
        puts "Number of ships: #{board.num_ships}"
        board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts 'you lose'
            true
        else
            false
        end
    end

    def win?
        if board.num_ships <= 0
            puts 'you win'
            true
        else
            false
        end
    end

    def game_over?
        win? || lose?
    end

    def turn
        move = player.get_move
        @remaining_misses -= 1 unless board.attack(move)
        puts "Remaining rockets: #{@remaining_misses}"
        board.print
    end

end
