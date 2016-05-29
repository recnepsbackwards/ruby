puts "How big would you like the board?"
$board_size = gets.chomp.to_i
$array = []

def set_board
  $board_size.times do
    a = new_row
    # p "*" * 20
    # p a
    # p "*" * 20
    $array << a
    # $board_size.times do
    #   $new_array << "_"
    # end
  end
end

def set_new_array
  $new_array = []
  $board_size.times do
    $new_row = []
    $board_size.times do
      $new_row << "_"
    end
    $new_array << $new_row
  end
  $new_array
end

def new_row
  $row = []
  $board_size.times do
    $row << add_cell
  end
  $row
end

def add_cell
  ["_", "_", "_", "X"].sample
end



# $array = [["_","_","_","_","_","_"],["_","_","_","_","_","_"],["_","_","X","X","X","_"],["_","X","X","X","_","_"],["_","_","_","_","_","_"]]
# $new_array = [["_","_","_","_","_","_"],["_","_","_","_","_","_"],["_","_","_","_","_","_"],["_","_","_","_","_","_"],["_","_","_","_","_","_"],["_","_","_","_","_","_"]]

def one_life
  $array.each_with_index do |row, i|
    $array[i].each_with_index do |cell, j|
      if cell == "_"
        # neightbors == 3 go alive
        if check_neighbors(i, j) == 3
          $new_array[i][j] = "X"
        # else stay dead
        else
          $new_array[i][j] = "_"
        end
      else # cell is alive
        # if neightbors < 2 || neighbors > 3
        if check_neighbors(i, j) < 2 || check_neighbors(i, j) > 3
          # die
          $new_array[i][j] = "_"
        # elsif neighbors == 2 || neighbors == 3
        else
          # stay alive
          $new_array[i][j] = "X"
        end
      end
    end
  end
end

def check_neighbors(row, col)
  alive_neighbors = 0
  len = $array[0].length - 1
  # top left
  unless row == 0
    unless col == 0
      if $array[row - 1][col - 1] == "X"
        alive_neighbors += 1
      end
    end
    # above
    if $array[row - 1][col] == "X"
      alive_neighbors += 1
    end
    # top right
    unless col == len
      if $array[row - 1][col + 1] == "X"
        alive_neighbors += 1
      end
    end
  end
  # left
  unless col == 0
    if $array[row][col - 1] == "X"
      alive_neighbors += 1
    end
  end
  # right
  unless col == len
    if $array[row][col + 1] == "X"
      alive_neighbors += 1
    end
  end
  # bottom left
  unless row == $array.length - 1
    unless col == 0
      if $array[row + 1][col - 1] == "X"
        alive_neighbors += 1
      end
    end
    # below
    if $array[row + 1][col] == "X"
      alive_neighbors += 1
    end
    # bottom right
    unless col == len
      if $array[row + 1][col + 1] == "X"
        alive_neighbors += 1
      end
    end
  end
  alive_neighbors
end


def render_board
  system('reset')
  $array = $new_array

  $new_array = set_new_array

  $array.each do |row|
    p row.join(' ')

  end
  sleep(0.1)

end

set_board
set_new_array
while true
  one_life
  render_board

end
