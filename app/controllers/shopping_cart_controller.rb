class ShoppingCartController < ApplicationController
  
  def show
    cart = ShoppingCart.find_by_user_id(current_user.id)
    if !cart.present?
      cart = create(current_user)
      cart.save
    end
    cart_records = ShoppingCartProduct.where(shopping_cart_id: cart.id)
    @cart_products = []

    cart_records.each do |cart_record|
      @cart_products.push(Product.find(cart_record.product_id))
    end
  end

  def create(user)
    ShoppingCart.new({ user_id: user.id })
  end
end