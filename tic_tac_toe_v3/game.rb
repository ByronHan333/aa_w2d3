require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  def initialize(n, hash)
    @board = Board.new(n)
    @players = hash.map do |k,v|
      if v
        ComputerPlayer.new(k)
      else
        HumanPlayer.new(k)
      end
    end
    @current_player = @players[0]
  end

  def switch_turn
    @players.rotate!
    @current_player = @players[0]
  end

  def play
    while @board.empty_positions?
      @board.print
      possible_moves = @board.legal_positions
      mark = @current_player.mark_value
      pos = @current_player.get_position(possible_moves)
      @board.place_mark(pos, mark)
      res = @board.win?(mark)
      if res
        puts "#{@current_player.mark_value} won"
        return
      else
        self.switch_turn
      end

    end
    puts "draw"
  end
end
