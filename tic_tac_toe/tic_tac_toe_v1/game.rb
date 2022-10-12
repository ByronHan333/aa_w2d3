require_relative 'board'
require_relative 'human_player'

class Game
  def initialize(player_1_mark, player_2_mark)
    @board = Board.new
    @player1 = HumanPlayer.new(player_1_mark)
    @player2 = HumanPlayer.new(player_2_mark)
    @current_player = @player1
  end

  def switch_turn
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def play
    while @board.empty_positions?
      @board.print
      mark = @current_player.mark_value
      pos = @current_player.get_position
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
