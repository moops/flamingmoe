require 'email_validator'

class Customer < ActiveRecord::Base

  has_many :orders

  validates :name, :email, :address, :city, :country, :credit_card, :expiry, presence: true
  validates :email, uniqueness: true
  validates :email, email: true
  validates :expiry, format: {
    with: /\A[0-1]\d{5}\z/,
    message: "format must be mmyyyy"
  }

end
