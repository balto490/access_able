require 'yelp'
require 'json'
require 'net/http'

class YelpClient < ApplicationRecord

@client = Yelp::Client.new({  consumer_key: '6gbO6CwCJXoUXbqlMHQlow',
                             consumer_secret: 'be81PalXLOhjVhMFPUrNjeiVJrQ',
                             token: 'bkZV1zn0tbAknFvmlQiZyCY31dpqxbHd',
                             token_secret: 'JX5wzEb9992XcSxPHc5_2aKvK80'
                          })

def self.search(term)
	response = @client.search('New York',{term: term})
	data = response.businesses.map do |b|
		#unless Location.find_by(yelpurl: b.url)
	{	name: b.name,
		category: b.categories,
		address: b.location.address.join(', '),
		phone: b.display_phone,
		image: b.image_url,
		open: b.is_closed,
		url: b.url,
		rating: b.rating,
		rating_img: b.rating_img_url,
		id: b.id,
		latitude: b.location.coordinate.latitude,
		longitude: b.location.coordinate.longitude

	}
	end
end

def self.cbsearch(term)
	response = @client.business(term)
	data = response.business 
end

end
