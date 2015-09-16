require 'csv'

CSV.foreach("#{Rails.root}/db/listings.csv", headers: true) do |row|
  House.create!(row.to_hash)
end
