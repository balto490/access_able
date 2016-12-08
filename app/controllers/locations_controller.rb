
class LocationsController < ApplicationController
 
  #before_action :set_location, only: [:show, :edit, :update, :destroy]
  
 # client = Yelp::Client.new({ consumer_key: ENV["YELP_CONSUMER_KEY"],
 #                             consumer_secret: ENV["YELP_CONSUMER_SECRET"],
 #                             token: ENV["YELP_TOKEN"],
 #                             token_secret: ENV["YELP_TOKEN_SECRET"]
 #                          })

 #  def info
 #    @location = Location.new
 #    @search = 'cafe'
 #    @responses = client.search("%#{params[:search]}%", { term: 'food', sort:2 })
    
 #    render json: @responses
 #    p @responses

 #    @responses.businesses.each do |foodPlace| 
 #      unless Location.find_by(yelpurl: foodPlace.url)
 #      {
 #      locactionId: foodPlace["id"],
 #      locationName: foodPlace["name"],
 #      locationReviews: foodPlace["review_count"],
 #      locationCategories: foodPlace["categories{0}"],
 #      locationAddress: foodPlace["display_address"],
 #      locationPhone: foodPlace["phone"],
 #      locationImg: foodPlace["image_url"],
 #      locationOpen: foodPlace["is_closed"],
 #      locationUrl: foodPlace["url"],
 #      locationRatingIcon: foodplace["rating"]
 #    }
      
        # @location = Location.new
        # @location.name = foodPlace.name
        # @location.longitude = foodPlace.location.coordinate.longitude
        # @location.latitude = foodPlace.location.coordinate.latitude
        # @location.yelpreviews = foodPlace.review_count
        # @location.foodtype = foodPlace.categories[0]
        # @location.address = foodPlace.location.display_address
        # @location.phone = foodPlace.phone
        # @location.img = foodPlace.image_url
        # @location.isopen = foodPlace.is_closed
        # @location.yelpurl = foodPlace.url
        # @location.yelpratingicon = foodPlace.rating
      #end
    #end
 
  #end

  # GET /locations
  # GET /locations.json
  def index
   @locations = Location.all
   @location = Location.new
   @term = params[:search] || ""
   @items = YelpClient.search(@term)

  
   # @items.each do |item|
   #    item.latitude,
     
   #    item.longitude
     
   #  end

   # if !user_signed_in?
   #  @user = User.find_by_id(current_user.id)
   #  params[:id] = current_user.id
   #  p "not signed in"
   # else
   #  @locations = Location.all
   #  p "#{current_user} signed in"
   # end
   # p @locations
  end



  # GET /locations/1
  # GET /locations/1.json
  def show
    
    @location = Location.find(params[:id])
    @term = @location.yelp_id
    @item = YelpClient.cbsearch(@term)
    @comment = Comment.new
    @comments = Comment.where(location_id: params[:id])
    @count = @comments.count
    @location_rating = @comments.map do |c| 
      c.user_rating
    end.reduce &:+
    
    if !@location_rating.nil?
      @rating = @location_rating/@count
    end
end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
    # p "Found edit... for #{params[:id]}"
    @location = Location.find(params[:id])
    p "params are... #{params[:yelp_id]}"
    p "Found Location... #{@location}"
    @term = @location.yelp_id
    p "term is... #{@term}"
    @item = YelpClient.cbsearch(@term)

  
  end

  # POST /locations
  # POST /locations.json
  def create
    @user_id = current_user.id
    @location = Location.create(location_params.merge(user_id: @user_id))

    respond_to do |format|
      if @location
        format.html { redirect_to edit_location_path(@location.id) }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    @location = Location.find(params[:id])
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to location_path(@location.id) }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_location
    #   @location = Location.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:category, :rating, :ramp, :step, :seating, :scooter, :comment, :user_id, :yelp_id)
    end


end
