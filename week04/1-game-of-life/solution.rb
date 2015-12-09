module GameOfLife
  class Cell
  end
  class Board
    include Enumerable

    attr_accessor :cells

    def initialize(*cells)
      @cells = []
      cells.each { |x| p x }
    end

    def each(&block)
      @cells.each(&block)
    end

    def [](x, y)
      @cells.include? [x, y]
    end

    def next_generation
    end
  end
end

board = GameOfLife::Board.new [1, 2], [2, 3]
