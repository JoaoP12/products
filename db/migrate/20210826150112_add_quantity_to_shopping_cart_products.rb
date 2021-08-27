class AddQuantityToShoppingCartProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :shopping_cart_products, :quantity, :integer
  end
end
