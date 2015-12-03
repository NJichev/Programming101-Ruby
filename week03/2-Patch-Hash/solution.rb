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
      end
    end
  end

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
  end
end
