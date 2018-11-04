module  SlidingPiece

  DIRECTIONS = {
    horizontal: [[0, -1], [-1, 0], [0, 1], [1, 0]],
    diagonal: [[-1, -1], [-1, 1], [1, 1], [1, -1]],
  }

  def horizontal_dirs
    DIRECTIONS[horizontal]
  end

  def diagonal_dirs
    DIRECTIONS[diagonal]
  end

  private

  def move_dirs
    raise "Not Implemented"
  end

  def next_unblocked_move

  end

end
