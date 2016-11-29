class Geocode < ApplicationRecord
	geocoded_by :address
	after_validation :geocode, :if => :address_changed?
	belongs_to :location
end
