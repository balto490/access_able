class GeocodesController < ApplicationController
  before_action :set_geocode, only: [:show, :edit, :update, :destroy]

  # GET /geocodes
  # GET /geocodes.json
  def index
    @geocodes = Geocode.all
  end

  # GET /geocodes/1
  # GET /geocodes/1.json
  def show
  end

  # GET /geocodes/new
  def new
    @geocode = Geocode.new
  end

  # GET /geocodes/1/edit
  def edit
  end

  # POST /geocodes
  # POST /geocodes.json
  def create
    @geocode = Geocode.new(geocode_params)

    respond_to do |format|
      if @geocode.save
        format.html { redirect_to @geocode, notice: 'Geocode was successfully created.' }
        format.json { render :show, status: :created, location: @geocode }
      else
        format.html { render :new }
        format.json { render json: @geocode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /geocodes/1
  # PATCH/PUT /geocodes/1.json
  def update
    respond_to do |format|
      if @geocode.update(geocode_params)
        format.html { redirect_to @geocode, notice: 'Geocode was successfully updated.' }
        format.json { render :show, status: :ok, location: @geocode }
      else
        format.html { render :edit }
        format.json { render json: @geocode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /geocodes/1
  # DELETE /geocodes/1.json
  def destroy
    @geocode.destroy
    respond_to do |format|
      format.html { redirect_to geocodes_url, notice: 'Geocode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_geocode
      @geocode = Geocode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def geocode_params
      params.require(:geocode).permit(:address, :latitude, :longitude)
    end
end
