require 'dotenv/load'
require 'httparty'

class BeachesController < ApplicationController
  before_action :set_beach, only: %i[ show edit update destroy ]

  # GET /beaches
  def index
    @beaches = Beach.all
  end

  def populate_beaches_from_google_places
    # Search method that the form is sending the query to
    search_query = params[:search_query]
    url = 'https://maps.googleapis.com/maps/api/place/textsearch/json'
    query = {
      query: {
        query: search_query + ' beaches',
        key: ENV['GOOGLE_MAPS_API_KEY']
      }
    }
    # Parsing the Json object (translating it to Ruby language)
    response = HTTParty.get(url, query)
    results = response.parsed_response['results']

    # and pushing each results attributes into the DB creating a Beach
    # instance
    results.each do |result|
      raise
      beach = Beach.new(
        name: result['name'],
        address: result['formatted_address'],
        photo_url: result['photos'].first['photo_reference'],
      )
      beach.save
    end

    redirect_to beaches_path, notice: 'Beaches populated successfully'
  end


  # GET /beaches/1
  def show
  end

  # GET /beaches/new
  def new
    @beach = Beach.new
  end

  # GET /beaches/1/edit
  def edit
  end

  # POST /beaches
  def create
    @beach = Beach.new(beach_params)

    if @beach.save
      redirect_to @beach, notice: "Beach was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /beaches/1
  def update
    if @beach.update(beach_params)
      redirect_to @beach, notice: "Beach was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /beaches/1
  def destroy
    @beach.destroy
    redirect_to beaches_url, notice: "Beach was successfully destroyed.", status: :see_other
  end

    def nearby
      url = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522%2C151.1957362&radius=1500&type=land&keyword=beach&key=#{ENV['GOOGLE_MAPS_API_KEY']}")

      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true

      request = Net::HTTP::Get.new(url)

      response = https.request(request)
      puts response.read_body

      # Process the response and render the view
      # You can assign the response data to an instance variable and use it in your view
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_beach
      @beach = Beach.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def beach_params
      params.require(:beach).permit(:address, :latitude, :longitude)
    end
end
