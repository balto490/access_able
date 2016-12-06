class WelcomeController < ApplicationController

def show
    @location = Location.all
    # @term = @location.yelp_id
    # @item = YelpClient.cbsearch(@term)
end

end
