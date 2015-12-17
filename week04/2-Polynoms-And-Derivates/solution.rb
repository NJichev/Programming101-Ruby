# Solution to second problem
class Function
  attr_reader :polynom

  def initialize(input)
    if input.is_a? Hash
      @polynom = input
    else
      @polynom = Hash.new(0)
      parse(input)
      sort_fx
      derivate
    end
  end

  def fx
    'f(x) = ' + to_str(@polynom)
  end

  def fxprim
    'f\'(x) = ' + to_str(@derivative)
  end

  private

  def to_str(fx)
    str = ''
    fx.each do |pow, coeff|
      if pow == 1
        str += "#{coeff} + "
      else
        str += "#{coeff}x^#{pow} + " unless pow == 0
      end
    end
    str += "#{fx[0]}"
    str.chomp!(' + ')
    str
  end

  def parse(input)
    input.split('+').each do |monom|
      coeff, pow = monom.strip.split('^')
      if coeff.include? 'x'
        pow ||= 1
        coeff.chop!
        coeff = 1 if coeff.empty?
      else pow ||= 0
      end
      @polynom[pow.to_i] += coeff.to_i
    end
  end

  def derivate
    @derivative = Hash.new(0)
    @polynom.each do |pow, coeff|
      @derivative[pow - 1] = pow * coeff unless pow == 0
    end
  end

  def sort_fx
    @polynom = @polynom.sort.reverse.to_h
  end
end

p Function.new(ARGV.join) if ARGV[0]
p Function.new('123x^2 + 11x + 123x^2 + x  +10x').fxprim
