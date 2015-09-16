class House < ActiveRecord::Base
  validates :street, :status, :price, :bedrooms, :bathrooms, :sq_ft,
            :latitude, :longitude, presence: true
  validates_inclusion_of :status, in: %w( active pending sold )
  validates_inclusion_of :latitude, in: (-90..90)
  validates_inclusion_of :longitude, in: (-180..180)
end
