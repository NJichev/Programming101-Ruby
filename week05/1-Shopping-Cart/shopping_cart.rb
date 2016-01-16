require 'bigdecimal'
require 'bigdecimal/util'

# Class for solution
class Cart
  def initialize(inventory)
    @items = inventory.items
    @purchases = Hash.new(0)
  end

  def add(item, quantity = 1)
    if @items[item].nil?
      throw "No such error."
    else
      @purchases[item] += quantity
    end
  end

  def total
    total = 0.to_d
    @purchases.each do |item, quantity|
      total += @items[item].to_d * quantity 
    end
    total
  end
end

class Inventory
  attr_reader :items

  def initialize
    @items = {}
  end

  def register(name, cost)
    @items[name] = cost
  end

  def new_cart
    Cart.new(self)
  end

  def length
    @items.length
  end
end
