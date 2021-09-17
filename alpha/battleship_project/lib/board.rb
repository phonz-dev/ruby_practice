class Board
    def self.print_grid(grid)
        grid.each { |row| puts row.join(' ') }
    end

    attr_reader :size
    def initialize(board_size)
        @grid = Array.new(board_size) { Array.new(board_size, :N) }
        @size = board_size * board_size
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def num_ships
        @grid.flatten.count { |tile| tile == :S }
    end

    def attack(pos)
        grid_tile = self[pos]

        if grid_tile == :S
            self[pos] = :H
            puts "you sunk my battleship!"
            true
        else
            self[pos] = :X
            false
        end
    end

    def place_random_ships
        prcnt = size * 0.25
        random_positions = board_positions.sample(prcnt)
        random_positions.each { |pos| self[pos] = :S }
        true
    end

    def board_positions
        positions = []
        (0...length).each do |row|
            (0...length).each do |col|
                positions << [row, col]
            end
        end
        positions
    end

    def length
        @grid.length
    end

    def hidden_ships_grid
        @grid.map { |row| row.map { |tile| tile == :S ? :N : tile } }
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
end
