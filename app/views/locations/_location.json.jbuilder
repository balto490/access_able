json.extract! location, :id, :created_at, :updated_at
json.url location_url(location, format: :json)

json.locations do
   json.array!(@locations) do |location|
     json.extract! location, :id, :name
   end
 end