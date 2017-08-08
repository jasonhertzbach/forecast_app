class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:home]
  # GET /cities
  # GET /cities.json
  def index
    @cities = current_user.cities.all

  end

  # GET /cities/1
  # GET /cities/1.json
  def show
    @weather = weather_get(@city.name)
  end

  # GET /cities/new
  def new
    @city = current_user.cities.new
  end

  # GET /cities/1/edit
  def edit
  end

  # POST /cities
  # POST /cities.json
  def create
    @city = current_user.cities.new(city_params)
    created = weather_get(params[:city][:name])
    if created

      @city = current_user.cities.new(city_params)
      if @city.save
        redirect_to cities_path, notice: "City added."
      else
        render :new
      end
    else
      redirect_to cities_path, notice: "City unavailable. Please try again."
    end
  end

  # PATCH/PUT /cities/1
  # PATCH/PUT /cities/1.json
  def update
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to @city, notice: 'City was successfully updated.' }
        format.json { render :show, status: :ok, location: @city }
      else
        format.html { render :edit }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cities/1
  # DELETE /cities/1.json
  def destroy
    @city.destroy
    respond_to do |format|
      format.html { redirect_to cities_url, notice: 'City was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_city
    @city = current_user.cities.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def city_params
    params.require(:city).permit(:user_id, :name)
  end
end
