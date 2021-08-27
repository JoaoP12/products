class ShoppingCartController < ApplicationController
  before_action :require_user_logged_in

  def show
    cart = ShoppingCart.find_by_user_id(Current.user.id)
    cart_records = ShoppingCartProduct.where(shopping_cart_id: cart.id)
    @cart_products = []

    cart_records.each do |cart_record|
      @cart_products.push(Product.find(cart_record.product_id))
    end
  end

  def create(user)
    @cart = ShoppingCart.new({ user_id: user.id })
  end
end