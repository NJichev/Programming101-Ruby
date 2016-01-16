# Implementation of our own Enumerable class
def some_method
  puts 'sometext'
end

# some doc comment
module MyEnumerable
  def map
<<<<<<< HEAD
    return to_enum(:map) unless block_given?
    answer = []
    each do |x|
      answer << yield(x)
    end
    self.class.new(*answer)
  end

  def filter
    answer = []
    each do |x|
      answer << x if yield x
    end
    answer
  end

  def reject
    answer = []
    each do |x|
      answer << x unless yield x
    end
    self.class.new(*answer)
  end

  def first
    found = nil
    each do |x|
      found = x
      break
    end
    found
  end

  def reduce(initial = nil, operator = nil, &block)
    initial = self[0] if initial.nil?
    # [1, 2, 3].reduce(0) { |init, x| init = x + x**2 }
    each do |x|
      # initial = block.call(initial, x)
      initial = yield(initial, x)
    end
    initial
  end

  def any?
    any = false
    each do |x|
      if yield x
        any = true
        break
      end
    end
    any
  end

  def all?
    all = true
    each do |x|
      unless yield x
        all = false
        break
      end
    end
    all
=======
    Array.new.tap do |arr|
      each do |element|
        value = yield element
        arr << value
      end
    end
  end

  def filter
    Array.new.tap do |arr|
      each do |element|
        arr << element if (yield element)
      end
    end
  end

  def first
    element = nil

    each do |x|
      element = x
      break
    end

    element
  end

  def reduce(initial = nil)
    skip_first = false

    if initial.nil?
      initial = first
      skip_first = true
    end

    each do |x|
      if skip_first
        skip_first = false
        next
      end
      initial = yield initial, x
    end

    initial
  end

  def negate_block(&block)
    proc { |x| !block.call(x) }
  end

  def reject(&block)
    filter(negate_block(&block))
  end

  def size
    map { |_| 1 }.reduce(0, &:+)
  end

  def any?(&block)
    filter(&block).size > 0
  end

  def all?(&block)
    filter(&block).size == size
>>>>>>> 11f01ef5e376cb5502b3f46c9e50cf82fa76c710
  end

  def include?(element)
    each do |x|
      return true if x == element
    end
    false
  end

  def count(element = nil)
<<<<<<< HEAD
<<<<<<< HEAD
    count = 0
    if element.nil?
      each { count += 1 }
    else
      each { |x| count += 1 if x == element }
    end

    count
  end

  def size
    size = 0
    each { size += 1 }
    size
=======
    if element.nil?
      return size
    end
=======
    return size if element.nil?
>>>>>>> 7a9ddf6a716592c86e2ff6aceb34fcaed25e9acf

    filter { |x| x == element }.size
>>>>>>> 11f01ef5e376cb5502b3f46c9e50cf82fa76c710
  end

  def min
    reduce { |min, x| min = min < x ? min : x }
  end

  def min_by
    min = first
    min_yield = yield min
    each do |x|
      if min_yield > (yield x)
        min_yield = yield x
        min = x
      end
    end
    min
  end

  def max
    reduce { |max, x| max = max > x ? max : x }
  end

  def max_by
    max = first
    max_yield = yield max
    each do |x|
      if max_yield < (yield x)
        max_yield = yield x
        max = x
      end
    end
    max
  end

  def take(n)
    n = size if n > size
    res = []
    index = 0
    each do |x|
      break if index == n
      res << x
      index += 1
    end
    self.class.new(*res)
  end

  def take_while
    res = []
    each do |x|
      if yield x
        res << x
      else
        break
      end
    end
    self.class.new(*res)
  end

  def drop(n)
    res = []
    index = 0
    each do |x|
      res << x if n < index + 1
      index += 1
    end
    self.class.new(*res)
  end

  def drop_while
    need_to_drop = 0
    each do |x|
      if yield x
        need_to_drop += 1
      else
        break
      end
    end
    drop(need_to_drop)
  end
end

# test class for MyEnumerable
class Collection
  include MyEnumerable

  def initialize(*data)
    @data = data
  end

  def each(&block)
    @data.each(&block)
  end

  def ==(otherCollection)
    @data == otherCollection.data
  end

  def get(index)
    return @data[index]
  end
end
<<<<<<< HEAD

<<<<<<< HEAD
collection = Collection.new(*[2, 4, 6, 3])
enum = collection.map
p enum
=======
class Collection
  include MyEnumerable

  def initialize(*data)
    @data = data
  end

  def each(&block)
    @data.each(&block)
  end

  def ==(otherCollection)
    @data == otherCollection.data
  end

  def get(index)
    return @data[index]
  end
end

>>>>>>> 11f01ef5e376cb5502b3f46c9e50cf82fa76c710
=======
>>>>>>> 7a9ddf6a716592c86e2ff6aceb34fcaed25e9acf
