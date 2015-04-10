TEST_BOARD = [['E', 'T', 'A', 'Q'], ['A', 'I', 'E', 'T'], ['R', 'L', 'T', 'N'], ['I', 'A', 'T', 'O']]

class DiceGroup
  attr_reader :dice
  def initialize
    @dice = [
      'AAEEGN',
      'ELRTTY',
      'AOOTTW',
      'ABBJOO',
      'EHRTVW',
      'CIMOTU',
      'DISTTY',
      'EIOSST',
      'DELRVY',
      'ACHOPS',
      'HIMNQU',
      'EEINSU',
      'EEGHNW',
      'AFFKPS',
      'HLNNRZ',
      'DEILRX'
    ]
  end
  def roll
    this_die = @dice.sample
    @dice.delete(this_die)
    this_die[rand(0..5)]
  end
end

class Coordinate
  attr_accessor :x, :y, :used, :next
  def initialize(x = nil, y = nil)
    @x = x
    @y = y
    @used = false
  end

  def to_s
    "(#{x}, #{y})"
  end

  def same_as?(coord)
    (self.x - coord.x) == 0 && (self.y - coord.y) == 0
  end

  def adjacent?(coord)
    return false if self.same_as?(coord)
    (self.x - coord.x).abs <= 1 && (self.y - coord.y).abs <= 1
  end

  def adjacents
    all = [0, 1, 2, 3].permutation(2).map { |pair| Coordinate.new(pair[0], pair[1]) }
    (0..3).each { |i| all << Coordinate.new(i, i) }
    all.select! { |coord1| coord1.adjacent?(self) }
    # returns array of adjacent coordinates
  end

end

class BoggleBoard
  attr_reader :board
  def initialize
    @board = Array.new(4) { (0..3).map { '_' } }
  end

  def test
    @board = TEST_BOARD
  end

  def shake!
    dice = DiceGroup.new
    @board = Array.new(4) { (0..3).map { dice.roll } }
  end

  def to_s
    string = ''
    board.each { |row|
      new_row = row.join('  ') + "  " + "\n"
      string << new_row.gsub(/Q /, 'Qu')
    }
    string
  end

  def include?(word)
    word.upcase!.gsub!(/QU/, 'Q')
    start_points = get_coords(word.slice!(0))
    path_found = false
    start_points.each { |start| path_found ||= find_path(start, word) }
    path_found
  end

  def find_path(coord, wordpath)
    return true if wordpath == ""
    adjacents = coord.adjacents
    path_found = false
    adjacents.each { |new_coord|
      if self.check_this_coord(new_coord) == wordpath[0]
        path_found ||= find_path(new_coord, wordpath.slice(1, wordpath.length))
      end
    }
    path_found
  end

  def get_coords(let)
    coords = []
    board.each_with_index { |row, ind_y|
      row.each_with_index { |letter, ind_x|
        if letter == let
          coords << Coordinate.new(ind_x, ind_y)
        end
      }
    }
    coords
  end

  def check_this_coord(coord)
    board[coord.y][coord.x]
  end

end

game = BoggleBoard.new
dice = DiceGroup.new
puts game
game.test
puts game

coord1 = Coordinate.new(0,2)
coord2 = Coordinate.new(0,1)
%w{aietno earil rlto quat ttie}.each { |word| p game.include?(word) }
%w{lro eitr non}.each { |word| p game.include?(word) == false }

