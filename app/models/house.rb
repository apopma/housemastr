class House < ActiveRecord::Base
  validates :street, :status, :price, :bedrooms, :bathrooms, :sq_ft,
            :latitude, :longitude, presence: true
  validates :status, inclusion: { in: ["pending", "active", "sold"] }
  validates :latitude, 
end
