class Roman
  @@numerals = {
    I: 1,
    V: 5,
    X: 10,
    L: 50,
    C: 100,
    D: 500,
    M: 1000
  }

  def self.const_missing(number)
    number.to_s.chars.map { |x| @@numerals[x.to_sym] }.reduce(&:+)
  end
end

p Roman::XIV
p Roman::XV
