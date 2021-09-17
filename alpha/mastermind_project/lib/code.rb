require "byebug"

class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(pegs)
    valid_pegs = POSSIBLE_PEGS.keys
    pegs.all? { |peg| valid_pegs.include?(peg.upcase) }
  end

  def self.random(length)
    valid_pegs = POSSIBLE_PEGS.keys
    random_pegs = []
    until random_pegs.length == length
      random_pegs << valid_pegs.sample
    end
    self.new(random_pegs)
  end

  def self.from_string(pegs)
    new_pegs = pegs.split("")
    self.new(new_pegs)
  end

  attr_reader :pegs

  def initialize(pegs)
    raise "Invalid pegs" unless Code.valid_pegs?(pegs)
    @pegs = pegs.map { |peg| peg.upcase }
  end

  def [](index)
    pegs[index]
  end

  def length
    pegs.length
  end

  def num_exact_matches(guess)
    matches = 0
    pegs.each_with_index do |peg, i|
      guess_peg = guess.pegs[i]
      matches += 1 if peg == guess_peg
    end
    matches
  end

  def num_near_matches(guess)
    new_guess_pegs, new_secret_pegs = eliminate_exact_matches(guess, pegs)

    near_matches_count = 0
    already_seen =  []

    new_guess_pegs.each do |peg|
      if new_secret_pegs.include?(peg) && !already_seen.include?(peg)
        already_seen << peg
        near_matches_count += 1
      end
    end

    near_matches_count
  end

  def eliminate_exact_matches(guess, secret)
    guess_pegs = guess.pegs.dup
    secret_pegs = secret.dup
  
    guess_pegs.each_with_index do |guess_peg, i|
      if guess_peg == secret_pegs[i]
        guess_pegs[i] = nil
        secret_pegs[i] = nil
      end
    end

    [guess_pegs.compact, secret_pegs.compact]
  end
  
  def ==(code)
    pegs == code.pegs
  end
end
