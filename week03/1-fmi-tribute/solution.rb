class Array
  def to_hash
    Hash.new.tap do |hash|
      each { |x| hash[x[0]] = x[1] }
    end
  end

  def index_by
    Hash.new.tap do |h|
      each do |x|
        h[yield x] = x
      end
    end
  end

  def subarray_count(sub_arr)
    # lame
    index, count = 0, 0
    while index < length - 1
      count += 1 if self[index..index + sub_arr.length - 1] == sub_arr
      index += 1
    end
    count
  end

  def occurences_count
    Hash.new(0).tap do |hash|
      each { |x| hash[x] += 1 }
    end
  end
end
