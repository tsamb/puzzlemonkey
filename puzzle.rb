=begin
PSEUDOCODE:
METHOD create_random_cell_objects
  CREATE an instance variable array "@cell_objects" containing 6 different objects, for now, represented as "X", "Y", "Z", "P", "Q", "R"
  CREATE an empty array called "randomized_cell_objects"
  LOOP at least as many times as there will be objects in the array
    SAMPLE a random element from cell_objects and SHOVEL that into randomized_cell_objects
  END
END

METHOD create_new_board (9 x 7)
  CREATE a new array "board" with 9 nil elements
    PASS the array constructor a block, SHIFTING the elements of @cell_objects into board
END
=end

require_relative 'Block.rb'

class Board
  BOARD_WIDTH = 7
  BOARD_HEIGHT = 9
  BOARD_SIZE = BOARD_WIDTH * BOARD_HEIGHT
  CELL_OBJECTS = [  Block.new({color: "red"}),
                    Block.new({color: "green"}),
                    Block.new({color: "blue"}),
                    Block.new({color: "yellow"}),
                    Block.new({color: "pink"}),
                    Block.new({color: "orange"})
                  ]

  attr_reader :randomized_cell_objects, :board

  def initialize
    create_new_board
  end

  def create_random_cell_objects
    randomized_cell_objects = []
    BOARD_SIZE.times do
      randomized_cell_objects << CELL_OBJECTS.sample
    end
    randomized_cell_objects
  end

  def create_new_board
    @board = Array.new(BOARD_HEIGHT) { create_random_cell_objects.shift(BOARD_WIDTH) }
  end  

  def display_board
    puts "    0   1   2   3   4   5   6 "
    puts "  -----------------------------"
    @board.each_with_index do |row_contents, row_i|
      print "#{row_i}"
      row_contents.each_with_index do |cell_contents, col_i|
        print " | #{cell_contents}"
      end
      print " |"
      puts "\n  -----------------------------"
    end
  end


  # To be passed a pair of two-element 1D coordinate arrays, e.g. [0,0], [1,1]
  def valid_move?(current_obj, next_obj, current_cell, test_cell)
    cc_row = current_cell[0]
    cc_col = current_cell[1]
    tc_row = test_cell[0]
    tc_col = test_cell[1]

    next_obj == current_obj &&
    cc_row == tc_row - 1 && cc_col == tc_col - 1 || \
    cc_row == tc_row - 1 && cc_col == tc_col     || \
    cc_row == tc_row - 1 && cc_col == tc_col + 1 || \
    cc_row == tc_row     && cc_col == tc_col + 1 || \
    cc_row == tc_row + 1 && cc_col == tc_col + 1 || \
    cc_row == tc_row + 1 && cc_col == tc_col     || \
    cc_row == tc_row + 1 && cc_col == tc_col - 1 || \
    cc_row == tc_row     && cc_col == tc_col - 1   
  end

def remove_elements(elements)
  elements.each { |coord| @board[coord[0]][coord[1]] = " " }
end

end

# board = Board.new
# board.create_new_board
# board.display_board

# p board.valid_move?("P", "P", [0,0],[1,1])
# p board.remove_elements([[0,0],[1,1],[2,2],[3,2],[4,2]])
# board.display_board