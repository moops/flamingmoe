class Product < ActiveRecord::Base

  has_many :orders

  validates :name, presence: true
  validates :price, presence: true

  def self.get_prices
    # return a hash of all products indexed by id eg. {id: :price, ...}
    {}.tap{ |h| Product.all.each{ |p| h[p.id] = p.price.to_f } }
  end

  def name_with_price
    "#{self.name} - $%0.2f" % [self.price.to_s]
  end

end
