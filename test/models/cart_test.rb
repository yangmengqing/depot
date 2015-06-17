require 'test_helper'

class CartTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end

  def new_cart_with_one_product(product)
    cart = Cart.create
    cart.add_product(product.id, product.price).save!
    cart
  end

  test 'cart should create a new line item when adding a new product' do
    cart = new_cart_with_one_product(products(:one))
    assert_equal 1, cart.line_items.length
    
    cart.add_product(products(:ruby).id, products(:ruby).price)
    assert_equal 2, cart.line_items.length
  end

  test 'cart should update an existing line item when adding an existing product' do
    product = products(:ruby)
    cart = new_cart_with_one_product(product)
    cart.add_product(product.id, product.price)
    assert_equal 1, cart.line_items.length
  end

  test 'cart line item should save price' do
    cart = carts(:cart1)
    [:ruby, :one, :ruby].each do |which_product|
      product = products(which_product)
      item = cart.add_product product.id, product.price
      assert_equal item.price, product.price, 'cart line item did not save price'
    end
  end

  test 'cart line item quantity should increment' do
    cart = carts(:cart2)
    product = products(:ruby)
    multiple = 3
    multiple.times { (cart.add_product product.id, product.price).save! }
    item = cart.line_items.find_by_product_id product.id
    assert_equal multiple, item.quantity, 'cart item quantity is incorrect'
  end

  test 'cart line item price should equal most-recent price' do
    cart = carts(:cart3)
    product = products(:ruby)
    sale_price = 0.8 * product.price

    [product.price, sale_price].each do |price|
      (cart.add_product product.id, price).save!
      item = cart.line_items.find_by_product_id product.id
      assert_equal price, item.price, "price #{item.price} is incorrect; should be #{price}"
    end
  end

  test 'cart should be created and destroyed' do
    assert_same Cart.count, Cart.destroy_all.count, 'unable to destroy existing carts'

    Cart.create
    assert_equal 1, Cart.count, 'unable to create cart'
    assert_equal 1, Cart.destroy_all.count, 'unable to destroy cart'
  end

end
