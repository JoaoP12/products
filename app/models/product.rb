class Product < ApplicationRecord
  include ActiveSupport::NumberHelper
  validates :description, :price, :title, :presence => true

  searchkick word_start: [:title, :description]

  def price_formatted
    number_to_currency(self.price, precision: 2, unit: 'R$ ')
  end

  def search_data
    {
      title: title,
      description: description
    }
  end
end
