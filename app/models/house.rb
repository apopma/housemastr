class House < ActiveRecord::Base
  validates :street, :status, :price, :bedrooms, :bathrooms, :sq_ft,
            :latitude, :longitude, presence: true

  validates_inclusion_of :status, in: %w( active pending sold ),
    message: "has to be 'active', 'pending', or 'sold'"

  validates_inclusion_of :latitude, in: (-90..90), message: "is not on this planet"
  validates_inclusion_of :longitude, in: (-180..180), message: "is not on this planet"

  validates_uniqueness_of :street, scope: [
    :status, :price, :bedrooms, :bathrooms, :latitude, :longitude
  ], message: "is a duplicate of some other database record"

  def self.min_price(val)
    House.where("price >= ?", val)
  end

  def self.max_price(val)
    House.where("price <= ?", val)
  end

  def self.min_bed(qty)
    House.where("bedrooms >= ?", qty)
  end

  def self.max_bed(qty)
    House.where("bedrooms <= ?", qty)
  end

  def self.min_bath(qty)
    House.where("bathrooms >= ?", qty)
  end

  def self.max_bath(qty)
    House.where("bathrooms <= ?", qty)
  end
end
