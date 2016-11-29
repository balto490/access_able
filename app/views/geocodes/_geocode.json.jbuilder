json.extract! geocode, :id, :address, :latitude, :longitude, :created_at, :updated_at
json.url geocode_url(geocode, format: :json)