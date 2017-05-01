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

  def dead?
    !@alive
  end

  def alive!
    @alive = true
  end

  def dead!
    @alive = false
  end
end
