class Life::Game
  attr_reader :width, :height, :cells

  # TODO Get initial state too
  def initialize(options = {})
    @width  = options[:width]  || 2
    @height = options[:height] || 2
    init_cells
  end

  def init_cells
    @cells = (1..width).map do |x|
      (1..height).map do |y|
        Life::Cell.new(x: x, y: y)
      end
    end
  end
end
