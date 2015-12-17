module GameOfLife
  class Board
    include Enumerable
    attr_accessor :cells

    def initialize(*cells)
      @cells = cells
    end

    def each(&block)
      @cells.each(&block)
    end

    def [](x, y)
      @cells.include? [x, y]
    end

    def count
      cells.count
    end

    def neighbors_num(x, y)
      cells.count do |cx, cy|
        dx = (x - cx).abs
        dy = (y - cy).abs

        dx <= 1 && dy <= 1 && !(dx == 0 && dy == 0)
      end
    end

    def neighbors(x, y)
      [[x - 1, y - 1], [x - 1, y], [x - 1, y + 1],
       [x + 1, y + 1], [x + 1, y], [x + 1, y + 1],
       [x, y + 1], [x, y - 1]]
    end

    def survive?(x, y)
      self[x, y] && ((2..3) === neighbors_num(x, y))
    end

    def ressurect?(x, y)
      neighbors_num(x, y) == 3
    end

    def next_generation
      survivors = @cells
      @cells.each do |cell|
        survivors += neighbors(*cell)
      end
      survivors.select! do |cell|
        survive?(*cell) || ressurect?(*cell)
      end
      Board.new(*survivors.uniq)
    end
  end
end

board = GameOfLife::Board.new [1, 2], [1, 3], [1, 4]
p board.next_generation
