$array = [["_","_","_","_","_","_"],["_","_","_","_","_","_"],["_","_","X","X","X","_"],["_","X","X","X","_","_"],["_","_","_","_","_","_"]]
$new_array = [["_","_","_","_","_","_"],["_","_","_","_","_","_"],["_","_","_","_","_","_"],["_","_","_","_","_","_"],["_","_","_","_","_","_"],["_","_","_","_","_","_"]]

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
  $new_array = [["_","_","_","_","_","_"],["_","_","_","_","_","_"],["_","_","_","_","_","_"],["_","_","_","_","_","_"],["_","_","_","_","_","_"],["_","_","_","_","_","_"]]
  $array.each do |row|
    print row.join(' ')
    print "\n"
  end

end


while true
  one_life
  render_board
  sleep(2)
end
