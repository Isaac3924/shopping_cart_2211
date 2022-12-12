require './lib/product'
require './lib/shopping_cart'

RSpec.describe ShoppingCart do
  describe 'Iteration 2' do
    it 'exists' do
      cart = ShoppingCart.new("King Soopers", "30items")

      expect(cart).to be_a(ShoppingCart)
    end

    it 'has attributes' do
      cart = ShoppingCart.new("King Soopers", "30items")

      expect(cart.name).to eq("King Soopers")
      expect(cart.capacity).to eq(30)
    end

    it 'starts with no products' do
      cart = ShoppingCart.new("King Soopers", "30items")

      expect(cart.products).to eq([])
    end

    it 'can add products to the cart' do
      cart = ShoppingCart.new("King Soopers", "30items")
      product_1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product_2 = Product.new(:meat, 'chicken', 4.50, '2')

      cart.add_product(product_1)
      cart.add_product(product_2)

      expect(cart.products).to eq([product_1, product_2])
    end

    it 'creates a hash of cart details' do
      cart = ShoppingCart.new("King Soopers", "30items")

      expect(cart.details).to eq({name: 'King Soopers', capacity: 30})
    end
  end

  describe 'Iteration 3' do
    it "can keep track of total number of products in cart" do
      cart = ShoppingCart.new("King Soopers", "30items")
      product_1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product_2 = Product.new(:meat, 'chicken', 4.50, '2')
      product_3 = Product.new(:paper, 'tissue paper', 1.25, '1')

      cart.add_product(product_1)
      cart.add_product(product_2)
      cart.add_product(product_3)

      expect(cart.total_number_of_products).to eq(13)
    end

    it "can tell if the cart is full" do
      cart = ShoppingCart.new("King Soopers", "30items")
      product_1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product_2 = Product.new(:meat, 'chicken', 4.50, '2')
      product_3 = Product.new(:paper, 'tissue paper', 1.25, '1')

      cart.add_product(product_1)
      cart.add_product(product_2)
      cart.add_product(product_3)

      expect(cart.total_number_of_products).to eq(13)
      expect(cart.is_full?).to eq(false)

      product_4 = Product.new(:produce, 'apples', 0.99, '20')

      cart.add_product(product_4)

      expect(cart.is_full?).to eq(true)
    end

    it "can see products by category" do
      cart = ShoppingCart.new("King Soopers", "30items")
      product_1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product_2 = Product.new(:meat, 'chicken', 4.50, '2')
      product_3 = Product.new(:paper, 'tissue paper', 1.25, '1')

      cart.add_product(product_1)
      cart.add_product(product_2)
      cart.add_product(product_3)

      expect(cart.products_by_category(:paper)).to eq([product_1, product_3])
    end
  end

  describe 'Iteration 4' do
    it "can show percentage ossupied in cart" do
      cart = ShoppingCart.new("King Soopers", "30items")
      product_1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product_2 = Product.new(:meat, 'chicken', 4.50, '2')
      product_3 = Product.new(:paper, 'tissue paper', 1.25, '1')

      cart.add_product(product_1)
      cart.add_product(product_2)
      cart.add_product(product_3)

      expect(cart.percentage_occupied).to eq(43.33)
    end

    it "can sort by quantity and provide a breakdown" do
      cart = ShoppingCart.new("King Soopers", "30items")
      product_1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product_2 = Product.new(:meat, 'chicken', 4.50, '2')
      product_3 = Product.new(:paper, 'tissue paper', 1.25, '1')
      product_4 = Product.new(:produce, 'apples', 0.99, '20')

      cart.add_product(product_1)
      cart.add_product(product_2)
      cart.add_product(product_3)
      cart.add_product(product_4)

      expect(cart.sorted_products_by_quantity).to eq([product_4, product_1, product_2, product_3])
      expect(cart.product_breakdown).to eq({:meat=>[product_2], :paper=>[product_1, product_3], :produce=>[product_4]})
    end
  end
end