class Order < ActiveRecord::Base

  belongs_to :customer
  belongs_to :product

  accepts_nested_attributes_for :customer

end
