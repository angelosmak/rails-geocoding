class BeachesController < ApplicationController
  before_action :set_beach, only: %i[ show edit update destroy ]

  # GET /beaches
  def index
    @beaches = Beach.all
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
