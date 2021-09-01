class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :email, presence: true, format: {
    with: /\A[^@\s]+@[^@\s]+\z/,
    message: "must be a valid email address"
  }
end