class ShoppingCart < ApplicationRecord
  belongs_to :user
  has_many :shopping_cart_products, dependent: :destroy
end
