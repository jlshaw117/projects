require "colorize"
require_relative "cursor"

class Display
  attr_reader :cursor, :board

  def initialize(board)
    @cursor, @board = Cursor.new([0,0], board), board
    nil
  end

  def render
    board.each_pos do |pos|
      if pos[0].even? && pos[1].even?
        color = :white
      elsif pos[0].even? && pos[1].odd?
        color = :light_blue
      elsif pos[0].odd? && pos[1].even?
        color = :light_blue
      elsif pos[0].odd? && pos[1].odd?
        color = :white
      end
      if cursor.cursor_pos == pos
        if cursor.selected
          color = :green
        else
          color = :red
        end
      end
      if pos[1] == 7
        puts " #{board[pos]} ".colorize(:background => color)
      else
        print " #{board[pos]} ".colorize(:background => color)
      end
    end
    nil
  end

  def get_positions
    pos = []
    until pos.length == 2
      system "clear"
      render
      input = cursor.get_input
      pos << cursor.cursor_pos if input
    end
    pos
  end

end
