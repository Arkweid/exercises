class PathFinder
  attr_reader :terrain, :position

  Coordinate = Struct.new(:x, :y, :actions)

  def initialize(terrain)
    @terrain = terrain
    @position = Coordinate.new(0, 0, [])
  end

  def find_way
    if can_down?
      go_down
      find_way
    end

    if can_right?
      go_right
      find_way
    end

    back unless start_position? || finish_position?
  end

  def print_path
    terrain.each do |line|
      p line
    end
    p position.actions
  end

  private

  def can_down?
    return false unless border_y?

    terrain[position.y + 1][position.x] == 1
  end

  def go_down
    position.y += 1
    memorize_action(__callee__)
  end

  def can_right?
    terrain[position.y][position.x + 1] == 1
  end

  def go_right
    position.x += 1
    memorize_action(__callee__)
  end

  def return_up
    position.y -= 1
  end

  def return_left
    position.x -= 1
  end

  def wrong_find_way
    terrain[position.y][position.x] = 0
  end

  def memorize_action(action)
    position.actions << action
  end

  def dememorize_action
    position.actions.pop
  end

  def back
    wrong_find_way
    case position.actions.last
    when :go_right
      return_left
    when :go_down
      return_up
    end
    dememorize_action
  end

  def start_position?
    position.x.zero? && position.y.zero?
  end

  def finish_position?
    position.y == terrain.size - 1 && position.x == terrain.last.size - 1
  end

  def border_y?
    terrain[position.y + 1]
  end
end