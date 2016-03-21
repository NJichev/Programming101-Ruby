class Vector
	attr_accessor :coordinates

  def initialize(*components)
		@coordinates = components.flatten
  end

  def dimension
		@coordinates.length
  end

  def length
		sum = 0
		@coordinates.each {|x| sum += x*x}
		sum**0.5
  end

  def normalize
		arr = [] 
		@coordinates.each do |x|
			x /= length
			arr << x
		end
		Vector.new(arr)
  end

  def [](index)
		@coordinates[index]
  end

  def []=(index, value)
		@coordinates[index] = value
  end

  def ==(other)
		@coordinates == other.coordinates
  end

  def +(value_or_vect)
		if value_or_vect.is_a? Vector
			arr = value_or_vect.coordinates
		else
			arr = Array.new(dimension, value_or_vect)
		end
		newvalues = []
		newvalues.push(arr, @coordinates)
		Vector.new newvalues.transpose.map {|x| x.reduce(:+)}
  end

  def -(value_or_vect)
		if value_or_vect.is_a? Vector
			arr = value_or_vect.coordinates.map {|x| x*-1}
			Vector.new(arr) + self
		else
			arr = value_or_vect*-1
			self + arr
		end
  end

  def *(scalar)
		arr = Array.new(dimension, scalar)
		newvalues = []
		newvalues.push(arr, @coordinates)
		Vector.new newvalues.transpose.map {|x| x.reduce(:*)}
  end

  def /(scalar)
		value = 1/scalar.to_f
		self * value
  end

  def dot(other)
		# ai * bi + ...
		dot_sum = 0
		#not sure if dot product is a thing for scalars
		if other.is_a? Vector
			other.coordinates.each_index do |index|
				dot_sum += other.coordinates[index] * @coordinates[index]
			end
			dot_sum
		else
			(self*other).coordinates.reduce(:+)
		end
  end

  def to_s
		@coordinates.to_s
  end
end

