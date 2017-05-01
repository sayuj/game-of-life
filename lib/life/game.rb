class Life::Game
  attr_reader :width, :height, :cells

  # TODO Get initial state too
  def initialize(options = {})
    @width  = options[:width]  || 2
    @height = options[:height] || 2
    init_cells
  end

  def neighbors(cell)
    x = cell.x
    y = cell.y
    neighbor_cells = []

    neighbor_cells << cells[x - 1][y - 1] if x > 0 && y > 0
    neighbor_cells << cells[x - 1][y]     if x > 0
    neighbor_cells << cells[x - 1][y + 1] if x > 0 && y < height - 1

    neighbor_cells << cells[x][y - 1]     if y > 0
    neighbor_cells << cells[x][y + 1]     if y < height - 1

    neighbor_cells << cells[x + 1][y - 1] if x < width - 1 && y > 0
    neighbor_cells << cells[x + 1][y]     if x < width - 1
    neighbor_cells << cells[x + 1][y + 1] if x < width - 1 && y < height - 1

    neighbor_cells
  end

  private

  def init_cells
    @cells = (0..(width - 1)).map do |x|
      (0..(height - 1)).map do |y|
        Life::Cell.new(x: x, y: y)
      end
    end
  end
end
