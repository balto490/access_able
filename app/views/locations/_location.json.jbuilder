json.extract! location, :id, :created_at, :updated_at
json.url location_url(location, format: :json)

json.resturants do
   json.array!(@resturants) do |resturant|
     json.extract! resturant, :id, :name
   end
 end