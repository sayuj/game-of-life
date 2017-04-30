class Life::Cell
  attr_reader :x, :y

  def initialize(options = {})
    @x     = options[:x] || 0
    @y     = options[:y] || 0
    @alive = options[:alive] || false
  end

  def alive?
    @alive
  end
end
