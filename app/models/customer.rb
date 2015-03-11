class Customer < ActiveRecord::Base

  has_many :orders

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :adddress, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :credit_card, presence: true
  validates :expiry, presence: true
  validates :expiry, format: {
    with: /[0-1]\d{5}/,
    message: "format must be mmyyyy"
  }

end
