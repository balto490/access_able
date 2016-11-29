class LocationsController < ApplicationController
  require "yelp"
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  
 client = Yelp::Client.new({ consumer_key: ENV["YOUR_CONSUMER_KEY"],
                            consumer_secret: ENV["YOUR_CONSUMER_SECRET"],
                            token: ENV["YOUR_TOKEN"],
                            token_secret: ENV["YOUR_TOKEN_SECRET"]
                          })

  def info
    @search = params[:search]
    @responses = client.search("%#{params[:search]}%", { term: 'resturant', offset: 40 })
    render json: @responses

    @responses.businesses.each do |foodPlace|
      unless Location.find_by(yelpurl: foodPlace.url)
        @location = Location.new
        @location.name = foodPlace.name
        @location.longitude = foodPlace.location.coordinate.longitude
        @location.latitude = foodPlace.location.coordinate.latitude
        @location.yelpreviews = foodPlace.review_count
        @location.foodtype = foodPlace.categories[0]
        @location.address = foodPlace.location.display_address
        @location.phone = foodPlace.phone
        @location.img = foodPlace.image_url
        @location.isopen = foodPlace.is_closed
        @location.yelpurl = foodPlace.url
        @location.yelpratingicon = foodPlace.rating
        @location.save!
      end
    end
 
  end

  # GET /locations
  # GET /locations.json
  def index
    
   if user_signed_in?
    @user = User.find_by_id(current_user.id)
    params[:id] = current_user.id
    p "not signed in"
   else
    @locations = Location.all
    p "#{current_user} signed in"
   end
   p @locations
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @name = params[:url]
    @location = Location.find_by(phone: @name)
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  # POST /locations.json
  def create
    @user = User.find_by_id(current_user.id)
    @location = Location.create(location_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @location
        format.html { redirect_to locations_path, notice: 'Location was successfully created.' }
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
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
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
      params.require(:location).permit(:category, :rating, :ramp, :step, :seating, :scooter, :comment, :user_id,)
    end
end
