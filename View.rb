require_relative 'puzzle.rb'

class View
  
  def initialize
    @board = Board.new
    @board.display_board
    input_loop
  end  

  def input_loop
    coords_array = []
    loop do
      input = gets.chomp
      if /^\d \d$/ =~ input
        coords = []
        p coords << input[0].to_i
        p coords << input[2].to_i
        if coords_array.size > 1 && 
        p coords_array << coords
      elsif input == ""
        @board.remove_elements(coords_array)
        break
      else
        puts "Please enter coords in 'num num' format, e.g. '0 2' without quote marks"
      end
    end
    print "\e[2J"
    p coords_array
    @board.display_board
  end
end

view = View.new