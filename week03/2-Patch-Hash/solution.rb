<<<<<<< HEAD
# patch hash for tasks
class Hash
  def pick(*keys)
    {}.tap do |hash|
      each do |key, val|
        hash[key] = val if keys.include? key
      end
    end
  end

  def except(*keys)
    {}.tap do |hash|
      each do |key, val|
        hash[key] = val unless keys.include? key
=======
class Object
  def tap
    yield self
    self
  end
end

class Hash
  def pick3(*keys)
    Hash.new.tap do |h|
      each do |k, v|
        h[k] = v if keys.include? k
>>>>>>> 11f01ef5e376cb5502b3f46c9e50cf82fa76c710
      end
    end
  end

<<<<<<< HEAD
  def compact_values
    {}.tap do |hash|
      each do |key, val|
        hash[key] = val if val
      end
    end
  end

  def defaults(hash)
    tap do |h|
      hash.each do |key, val|
        h[key] = val unless h[key]
      end
    end
  end

  def pick!(*keys)
    tap do |hash|
      each do |key, val|
        hash[key] = val if keys.include? key
      end
    end
  end

  def except!(*keys)
    each do |key, val|

    end
  end

  def compact_values!
    {}.tap do |hash|
      each do |key, val|
        hash[key] = val if val
      end
    end
  end

  def defaults!(hash)
    tap do |h|
      hash.each do |key, val|
        h[key] = val unless h[key]
      end
    end
=======
  def pick2(*keys)
    select do |k, v|
      keys.include? k
    end
  end

  def pick(*keys)
    result = {}

    each do |k, v|
      result[k] = v if keys.include? k
    end

    result
  end

  def except2(*keys)
    reject { |k, v| keys.include? k }
  end


  def except(*keys)
    result = {}

    each do |k, v|
      result[k] = v unless keys.include? k
    end

    result
  end

  def compact_values
    select { |key, value| value }
  end

  def defaults

>>>>>>> 11f01ef5e376cb5502b3f46c9e50cf82fa76c710
  end
end
