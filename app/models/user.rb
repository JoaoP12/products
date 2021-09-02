class User < ApplicationRecord
  has_one :shopping_cart, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  enum role: {
    user: 0,
    moderator: 1,
    admin: 2
  }

  validates :email, presence: true, format: {
    with: /\A[^@\s]+@[^@\s]+\z/,
    message: "must be a valid email address"
  }
end