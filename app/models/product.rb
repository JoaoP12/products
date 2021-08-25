class Product < ApplicationRecord
  include ActiveSupport::NumberHelper
  validates :description, :price, :title, :presence => true
  def price_formatted
    number_to_currency(self.price, precision: 2, unit: 'R$ ')
  end
end
