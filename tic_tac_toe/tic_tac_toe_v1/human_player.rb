class HumanPlayer
  attr_reader :mark_value
  def initialize(mark_value)
    @mark_value = mark_value
  end

  def get_position
    puts "Player #{@mark_value}, enter two numbers representing a position in the format `row col`"
    user_input = gets.chomp
    arr = user_input.split
    if arr.length!=2
      raise RuntimeError.new('input was invalid')
    end

    if arr[0].count('0-9') < arr[0].length || arr[1].count('0-9') < arr[1].length
      raise RuntimeError.new('input needs number only')
    end

    [arr[0].to_i, arr[1].to_i]

  end

end
