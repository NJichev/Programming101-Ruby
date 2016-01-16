require 'minitest/autorun'
require 'bigdecimal'
require 'bigdecimal/util'

require_relative 'shopping_cart.rb'

# Class for testing our code
class ShoppingCartTest < Minitest::Test
  

  def test_register_item_in_inventory
    inventory = Inventory.new

    inventory.register 'Green Tea', '1.99'
    inventory.register 'Red Tea',   '2.49'
    inventory.register 'Earl Grey', '1.49'

    assert_equal 3, inventory.length
  end

  def test_cart_total
    inventory = Inventory.new
    inventory.register 'Green Tea', '1.99'
    inventory.register 'Red Tea',   '2.49'
    inventory.register 'Earl Grey', '1.49'

    cart = inventory.new_cart

    cart.add 'Green Tea'
    cart.add 'Red Tea', 2
    cart.add 'Green Tea', 2

    assert_equal '10.95'.to_d == cart.total
  end

  # def test_cart_total_get_one_free_base_case
  #   inventory.register 'Green Tea', '1.00', get_one_free: 4
  #   cart.add 'Green Tea', 3
  #   assert_equal '3.00'.to_d == cart.total
  # end

  # def test_cart_total_get_one_free_get_one_free
  #   inventory.register 'Green Tea', '1.00', get_one_free: 4
  #   cart.add 'Green Tea', 8
  #   assert_equal '6.00'.to_d == cart.total
  # end

  # def test_cart_total_get_percentage
  #   inventory.register 'Red Tea', '1.00', package: { 3 => 20 }

  #   cart.add 'Red Tea', 4
  #   assert_equal '3.40'.to_d == cart.total
  # end

  # def test_cart_total_get_treshhold_1
  #   inventory.register 'Earl Grey', '1.00', threshold: { 10 => 50 }

  #   cart.add 'Earl Grey', 15

  #   assert_equal cart.total == '12.50'.to_d
  # end

  # def test_cart_total_get_treshhold_2
  #   inventory.register 'Earl Grey', '1.00', threshold: { 10 => 50 }

  #   cart.add 'Earl Grey', 20

  #   assert_equal cart.total == '15.00'.to_d
  # end

  # def test_cart_total_with_coupon_percent
  #   inventory.register 'Red Tea', '1.00'
  #   inventory.register_coupon 'TEATIME', percent: 20

  #   cart = inventory.new_cart
  #   cart.add 'Red Tea', 10
  #   cart.use 'TEATIME'

  #   assert_equal '8.00'.to_d == cart.total
  # end

  # def test_cart_total_with_coupon_friends
  #   inventory.register 'Red Tea', '1.00'
  #   inventory.register_coupon 'FRIENDS', amount: '7.00'

  #   cart = inventory.new_cart
  #   cart.add 'Red Tea', 10
  #   cart.use 'FRIENDS'

  #   assert_equal '3.00'.to_d == cart.total
  # end

  # def test_cart_total_with_coupon_friends_get_zero_price
  #   inventory.register 'Red Tea', '1.00'
  #   inventory.register_coupon 'FRIENDS', amount: '7.00'

  #   cart = inventory.new_cart
  #   cart.add 'Red Tea', 5
  #   cart.use 'FRIENDS'

  #   assert_equal '0.00'.to_d == cart.total
  # end

  # def test_cart_invoice
  #   inventory.register 'Green Tea',    '0.79'
  #   inventory.register 'Earl Grey',    '0.99'
  #   inventory.register 'Black Coffee', '1.99'

  #   cart.add 'Green Tea'
  #   cart.add 'Earl Grey', 3
  #   cart.add 'Black Coffee', 2

  #   res = <<-EOF
  #     +------------------------------------------------+----------+
  #     | Name                                       qty |    price |
  #     +------------------------------------------------+----------+
  #     | Green Tea                                    1 |     0.79 |
  #     | Earl Grey                                    3 |     2.97 |
  #     | Black Coffee                                 2 |     3.98 |
  #     +------------------------------------------------+----------+
  #     | TOTAL                                          |     7.74 |
  #     +------------------------------------------------+----------+
  #   EOF

  #   assert_equal res == cart.invoice
  # end

  # def test_cart_invoice_with_reflection
  #   inventory.register 'Green Tea',    '2.79', get_one_free: 2
  #   inventory.register 'Black Coffee', '2.99', package: { 2 => 20 }
  #   inventory.register 'Milk',         '1.79', threshold: { 3 => 30 }
  #   inventory.register 'Cereal',       '2.49'
  #   inventory.register_coupon 'BREAKFAST', percent: 10

  #   cart = inventory.new_cart
  #   cart.add 'Green Tea', 8
  #   cart.add 'Black Coffee', 5
  #   cart.add 'Milk', 5
  #   cart.add 'Cereal', 3
  #   cart.use 'BREAKFAST'

  #   res = <<-EOF
  #     +------------------------------------------------+----------+
  #     | Name                                       qty |    price |
  #     +------------------------------------------------+----------+
  #     | Green Tea                                    8 |    22.32 |
  #     |   (buy 1, get 1 free)                          |   -11.16 |
  #     | Black Coffee                                 5 |    14.95 |
  #     |   (get 20% off for every 2)                    |    -2.39 |
  #     | Milk                                         5 |     8.95 |
  #     |   (30% off of every after the 3rd)             |    -1.07 |
  #     | Cereal                                       3 |     7.47 |
  #     | Coupon BREAKFAST - 10% off                     |    -3.91 |
  #     +------------------------------------------------+----------+
  #     | TOTAL                                          |    35.16 |
  #     +------------------------------------------------+----------+
  #   EOF

  #   assert_equal res == cart.invoice
  # end
end
