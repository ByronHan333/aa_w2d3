require 'byebug'

class Board
  attr_reader :size

  def self.print_grid(grd)
    grd.each do |row|
      puts row.join(' ')
    end
  end

  def initialize(n)
    @grid = Array.new(n) {Array.new(n, :N)}
    @size = n*n
  end

  def [](arr)
    @grid[arr[0]][arr[1]]
  end

  def []=(arr, val)
    @grid[arr[0]][arr[1]] = val
  end

  def num_ships
    @grid.sum do |subarray|
      subarray.count{|el| el==:S}
    end
  end

  def attack(pos)
    if self[pos] == :S
      self[pos] = :H
      puts 'you sunk my battleship!'
      return true
    else
      self[pos] = :X
      return false
    end
  end

  def place_random_ships
    n = @grid.length
    ar = (0...n).to_a.sample(n/2)
    ac = (0...n).to_a.sample(n/2)
    ar.each do |r|
      ac.each do |c|
        self[[r,c]] = :S
      end
    end
  end

  def hidden_ships_grid
    n = @grid.length
    hidden_grid = Array.new(n) {Array.new(n, :N)}
    hidden_grid.each_with_index do |subarray, r|
      subarray.each_with_index do |v, c|
        # debugger
        hidden_grid[r][c] = self[[r,c]]==:S ? :N : self[[r,c]]
      end
    end
    hidden_grid
  end

  def cheat
    self.class.print_grid(@grid)
  end

  def print
    self.class.print_grid(self.hidden_ships_grid)
  end
end

