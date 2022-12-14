require_relative "board"
require_relative "player"

class Battleship
  attr_reader :board, :player
  def initialize(n)
    @player = Player.new
    @board = Board.new(n)
    @remaining_misses = @board.size / 2
  end

  def start_game
    @board.place_random_ships
    puts @board.num_ships
    @board.print
  end

  def lose?
    if @remaining_misses <= 0
      puts 'you lose'
      return true
    else
      return false
    end
  end

  def win?
    return false if @board.num_ships != 0
    puts 'you win'
    true
  end

  def game_over?
    return true if win? || lose?
    false
  end

  def turn
    pos = @player.get_move
    res = @board.attack(pos)
    @remaining_misses -= 1 if !res
    @board.print
    puts @remaining_misses

  end
end
