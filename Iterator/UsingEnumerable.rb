class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def <=> (other_product)
    self.price <=> other_product.price
  end
end

class Shop
  include Enumerable
  def initialize
    @products = []
  end

  def << (product)
    @products << product
  end

  def each(&block)
    @products.each(&block)
  end
end

apple = Product.new('Apple', 1.5)
orange = Product.new('Orange', 5.5)
banana = Product.new('Banana', 4.5)

fruit_shop = Shop.new
fruit_shop << apple
fruit_shop << orange
fruit_shop << banana

sorted_fruits = fruit_shop.sort
sorted_fruits.each { |fruit| puts("#{fruit.name} is on sale for #{fruit.price}") }
puts("Are all fruits more expensive than 6? #{ fruit_shop.all? { |fruit| fruit.price > 6 } }")
