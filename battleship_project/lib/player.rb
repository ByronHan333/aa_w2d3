class Player
  def get_move
    puts 'enter a position with coordinates separated with a space like `4 7`'
    u_input = gets.chomp
    a,b = u_input.split
    [a.to_i, b.to_i]
    # u_input.split.map(&:to_i)
  end
end
