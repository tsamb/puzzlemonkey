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


class Board
  BOARD_WIDTH = 7
  BOARD_HEIGHT = 9
  BOARD_SIZE = BOARD_WIDTH * BOARD_HEIGHT
  CELL_OBJECTS = ["X", "Y", "Z", "A", "B", "C"]

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
    puts " -----------------------------"
    @board.each_with_index do |row_contents, row_i|
      row_contents.each_with_index do |cell_contents, col_i|
        print " | #{cell_contents}"
      end
      print " |"
      puts "\n -----------------------------"
    end
  end
end

board = Board.new

board.display_board

