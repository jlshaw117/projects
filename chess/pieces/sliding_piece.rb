require "byebug"
module  SlidingPiece

  DIRECTIONS = {
    horizontal: [[0, -1], [-1, 0], [0, 1], [1, 0]],
    diagonal: [[-1, -1], [-1, 1], [1, 1], [1, -1]],
  }

  def horizontal_dirs
    DIRECTIONS[:horizontal]
  end

  def diagonal_dirs
    DIRECTIONS[:diagonal]
  end

  def moves

    moves = []
    move_dirs.each do |diffs|
      debugger
      #assighnment issue
      new_pos = pos.map.with_index {|num, i| num + diffs[i]}
      while board[new_pos].is_a?(NullPiece)
        moves << new_pos
        new_pos.map!.with_index {|num, i| num + diffs[i]}
      end
    end
    moves << new_pos unless board[new_pos].color == color
    moves
  end

  private

  def move_dirs
    raise "Not Implemented"
  end

  def next_unblocked_move(dir)

  end

end
