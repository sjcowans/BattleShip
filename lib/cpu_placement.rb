
require './lib/ship'
require './lib/board'

class CpuPlacement
  attr_reader :board,
              :ship
  attr_accessor :coordinates
 

  def initialize(ship, board)
    @ship = ship 
    @board = board
  end

  def cpu_placement
    coordinate_array = []
    ("A"..@board.row).each do |letter|
      (1..@board.column).each do |number|
        coordinate = letter + number.to_s
        coordinate_array << coordinate
      end
    end
    @coordinates = coordinate_array.sample(@ship.length) 
    @coordinates = coordinate_array.sample(@ship.length) until (board.valid_placement?(@ship, @coordinates)) == true
    board.valid_placement?(@ship, @coordinates)
    board.place(@ship, @coordinates)
  end
end