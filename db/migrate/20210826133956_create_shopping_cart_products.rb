class CreateShoppingCartProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_cart_products do |t|
      t.integer :shopping_cart_id
      t.integer :product_id

      t.timestamps
    end
  end
end
