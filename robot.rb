class Robot
  DIRECTIONS = [:north, :east, :south, :west]

  def orient(direction)
    raise ArgumentError unless DIRECTIONS.include?(direction)

    @direction = direction
  end

  def bearing
    @direction
  end

  def turn_right
    move_direction(1)
  end

  def turn_left
    move_direction(-1)
  end

  private

  def move_direction(left_right)
   new_index = (current_index + left_right) % DIRECTIONS.length 

   @direction = DIRECTIONS[new_index]
  end

  def current_index
   DIRECTIONS.index(@direction)
  end
end
