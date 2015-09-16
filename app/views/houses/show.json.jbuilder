json.type "FeatureCollection"

json.features do
  json.array! @houses do |house|
    json.type "Feature"

    json.geometry do
      json.type "Point"
      json.coordinates do
        json.array! [house.longitude, house.latitude]
      end
    end

    json.properties do
      json.extract! house, :id, :price, :street, :bedrooms, :bathrooms, :sq_ft
    end
  end
end
