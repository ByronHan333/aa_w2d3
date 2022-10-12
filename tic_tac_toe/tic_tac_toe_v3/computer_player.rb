class ComputerPlayer
  attr_reader :mark_value
  def initialize(mark_value)
    @mark_value = mark_value
  end

  def get_position(legal_positions)
    puts "Computer player #{@mark_value}, enter two numbers representing a position in the format `row col`"
    pos = legal_positions.sample
    puts "Computer player #{@mark_value} entered #{pos}"
    pos
  end
end
