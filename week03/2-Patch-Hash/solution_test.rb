require 'minitest/autorun'

require_relative 'solution'

# Test class for the hash monkey patching
class SolutionTest < Minitest::Test
  def test_pick
    hash = { a: 1, b: 2, c: 3 }

    assert_equal(({ a: 1, b: 2 }), hash.pick(:a, :b))
  end

  def test_except
    hash = { a: 1, b: 2, d: nil }
    assert_equal(({ a: 1, b: 2 }), hash.except(:d))
  end

  def test_compact_values
    hash = { a: 1, b: 2, c: false, d: nil }
    assert_equal(({ a: 1, b: 2 }), hash.compact_values)
  end

  def test_defaults
    hash = { a: 1, b: 2 }
    assert_equal(({ a: 1, b: 2, c: 3 }), hash.defaults(a: 4, c: 3))
  end
end
