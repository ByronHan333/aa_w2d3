class Board
  def initialize
    @grid = Array.new(3){Array.new(3, '_')}
  end

  def [](pos)
    r,c = pos
    @grid[r][c]
  end

  def []=(pos, mark)
    r,c = pos
    @grid[r][c] = mark
  end

  def valid?(pos)
    r, c = pos
    return true if r < 3 && c < 3 && r > -1 && c > -1
    false
  end

  def empty?(pos)
    return true if self[pos]=='_'
    false
  end

  def place_mark(pos, mark)
    if !valid?(pos) || !empty?(pos)
      raise RuntimeError.new('invalid mark')
    end
    self[pos] = mark
  end

  def print
    @grid.each{|row| puts row.join(' ')}
  end

  def win_row?(mark)
    @grid.any? do |row|
      row.all?{|el| el==mark}
    end
  end

  def win_col?(mark)
    (0...3).any? do |col|
      @grid.all?{|row| row[col]==mark}
    end
  end

  def win_diagonal?(mark)
    # left diag
    r1 = (0...3).all?{|i| self[[i,i]]==mark}
    # right diag
    r2 = (0...3).all?{|i| self[[i,2-i]]==mark}
    return true if r1 || r2
    false
  end

  def win?(mark)
    return true if win_col?(mark) ||  win_diagonal?(mark) || win_diagonal?(mark)
  end

  def empty_positions?
    @grid.any?{|row| row.any?{|el| el=='_'}}
  end

end
