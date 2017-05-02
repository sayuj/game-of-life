class Life::Game
  attr_reader :width, :height, :cells

  def initialize(options = {})
    @width  = options[:width]  || 2
    @height = options[:height] || 2
    init_cells(options[:live_cells] || [])
  end

  def play
    loop do
      system 'clear'
      display
      evolve!
      sleep(1)
    end
  end

  def display
    output = cells.map do |row_cells|
      row_cells.map do |cell|
        cell.alive? ? '*' : '-'
      end.join("\t")
    end.join("\n\n")

    puts output
  end

  def evolve!
    next_gen_cells = (0..(width - 1)).map do |x|
      (0..(height - 1)).map do |y|
        next_generation(cells[x][y])
      end
    end
    @cells = next_gen_cells
  end

  def neighbours(cell)
    neighbour_positions(cell.x, cell.y).map do |x, y|
      cells[x][y]
    end
  end

  def live_neighbours(cell)
    neighbours(cell).select(&:alive?)
  end

  def next_generation(cell)
    next_gen_cell = cell.dup

    next_gen_cell.dead!  if live_neighbours(cell).count < 2 ||
                            live_neighbours(cell).count > 3
    next_gen_cell.alive! if live_neighbours(cell).count == 3

    next_gen_cell
  end

  private

  def init_cells(live_cells = [])
    @cells = (0..(width - 1)).map do |x|
      (0..(height - 1)).map do |y|
        cell = Life::Cell.new(x: x, y: y)
        cell.alive! if live_cells.include? [x, y]
        cell
      end
    end
  end

  def neighbour_positions(x, y)
    all_possible_neighbour_positions(x, y).select do |i, j|
      (0..(width - 1)).cover?(i) && (0..(height - 1)).cover?(j)
    end
  end

  def all_possible_neighbour_positions(x, y)
    [
      [x - 1, y - 1], [x - 1, y], [x - 1, y + 1],
      [x, y - 1], [x, y + 1],
      [x + 1, y - 1], [x + 1, y], [x + 1, y + 1]
    ]
  end
end
