=begin
1) Select first element, within nested array.
2) Call adjacent on this element. As the argument for adjacent
put in every one of the elements on the next nested array.
3)


=end



TEST_BOARD = [['E', 'T', 'A', 'A'], ['A', 'I', 'E', 'T'], ['R', 'L', 'T', 'N'], ['I', 'A', 'T', 'O']]

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
    @next = nil
  end
  def to_s
    "(#{x}, #{y})"
  end
  def adjacent?(coord)
    (self.x - coord.x).abs <= 1 && (self.y - coord.y).abs <= 1
  end
end

class BoggleBoard
  attr_reader :board
  def initialize
    @board = TEST_BOARD
    # Array.new(4) { (0..3).map { '_' } }
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
    word.upcase!
    nested_array = []
    word.each_char { |c|
      nested_array << get_coords(c)
    }
    find_path(nested_array)
    found = false
    nested_array[0].each { |coord|
      node = coord
      (word.length - 1).times {
        node = node.next if node
      }
      found ||= !!node
    }
    found
  end

  def find_path(array)
    array.each_with_index do |sub_array, i|
      sub_array.each do |coord1|
        break if i == array.length - 1
        array[i+1].each do |coord2|
          if coord1.adjacent?(coord2)
            coord1.next = coord2
          end
        end
      end
    end
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

end

game = BoggleBoard.new
dice = DiceGroup.new
puts game

coord1 = Coordinate.new(0,2)
coord2 = Coordinate.new(0,1)
puts game.include?('ALI')
puts game.include?('alton')
puts game.include?('lirt') == false


