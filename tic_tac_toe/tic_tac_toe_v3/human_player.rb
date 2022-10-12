# https://www.youtube.com/watch?v=jnerdArQT0Q&ab_channel=edutechional

class HumanPlayer
  attr_reader :mark_value
  def initialize(mark_value)
    @mark_value = mark_value
  end

  def get_position(legal_positions)
    puts "Player #{@mark_value}, enter two numbers representing a position in the format `row col`"
    user_input = gets.chomp
    arr = user_input.split
    if arr.length!=2
      puts "input was invalid"
      raise RuntimeError.new('input was invalid')
    end

    if arr[0].count('0-9') < arr[0].length || arr[1].count('0-9') < arr[1].length
      puts "input needs number only"
      raise RuntimeError.new('input needs number only')
    end

    pos = [arr[0].to_i, arr[1].to_i]
    if !legal_positions.include?(pos)
      puts "#{pos} was not in legal position"
      raise RuntimeError.new('input was not in legal position')
    end

    pos

  rescue
    retry
  end

end
