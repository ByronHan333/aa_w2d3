require_relative 'board'
require_relative 'human_player'

class Game
  def initialize(n, *player_marks)
    @board = Board.new(n)
    @num_player = player_marks.length
    @players = player_marks.map{|p| HumanPlayer.new(p)}
    @current_player = @players[0]
  end

  def switch_turn
    @players.rotate!
    @current_player = @players[0]
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
