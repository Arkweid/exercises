# Постановка задачи:
# Робот стоит в левом верхнем углу сетки, состоящей из r строк и с столбцов.
# Робот может перемещаться в двух направлениях: вправо и вниз, но некоторые
# ячейки сетки заблокированы, то есть робот через них проходить не может.
# Разработайте алгоритм построения маршрута от левого верхнего до правого
# нижнего угла.


class PathFinder
  attr_reader :terrain, :position

  Coordinate = Struct.new(:x, :y, :actions)

  def initialize(terrain)
    @terrain = terrain
    @position = Coordinate.new(0, 0, [])
  end

  def find_way
    if can_move_down?
      move_down
      find_way
    end

    if can_move_right?
      move_right
      find_way
    end

    back unless start_position? || finish_position?
  end

  def print_path
    terrain.each { |line| p line }
    p position.actions
  end

  private

  def can_move_down?
    return false unless cross_border_y?

    terrain[position.y + 1][position.x] == 1
  end

  def move_down
    position.y += 1
    memorize_action(:move_down)
  end

  def can_move_right?
    terrain[position.y][position.x + 1] == 1
  end

  def move_right
    position.x += 1
    memorize_action(:move_right)
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
    when :move_right
      return_left
    when :move_down
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

  def cross_border_y?
    terrain[position.y + 1]
  end
end