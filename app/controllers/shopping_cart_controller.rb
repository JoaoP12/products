class ShoppingCartController < ApplicationController
  
  def show
    cart = user_cart(current_user)
    cart_records = ShoppingCartProduct.where(shopping_cart_id: cart.id)
    @cart_products = []
    cart_records.each do |cart_record|
      @cart_products.push(Product.find_by_id(cart_record.product_id))
    end
  end

  def add_product
    product = ShoppingCartProduct.new({
      product_id: params[:product_id],
      quantity: params[:quantity],
      shopping_cart_id: user_cart(current_user).id
    })
    if product
      product.save
      redirect_to products_path, notice: "Product added to cart successfully"
    else
      redirect_to products_path, alert: "Something went wrong. Please, try again"
    end
  end

  def delete_product
    cart = user_cart(current_user)
    product = ShoppingCartProduct.find_by(product_id: params[:product_id],
      shopping_cart_id: cart.id)

    product.destroy
    redirect_to shopping_cart_path, notice: "Product removed successfully"
  end

  def user_cart(user)
    cart = ShoppingCart.find_by_user_id(user.id)
    if cart.present?
      ShoppingCart.find_by_user_id(user.id)
    else
      cart = ShoppingCart.new({ user_id: user.id })
      cart.save
      return cart
    end
  end
end