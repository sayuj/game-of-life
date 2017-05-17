# Game of life

Here is a solution to [Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) problem in Ruby.

### Test

`bundle exec rspec`

### How to play?

```ruby
require './lib/life'
life = Life::Game.new(width: 5, height: 5, live_cells: [[1, 2], [2, 2], [3, 2]])
life.play
```
