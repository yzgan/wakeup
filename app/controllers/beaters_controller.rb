class BeatersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_beater, only: [:show, :edit, :update, :destroy]

  # GET /beaters
  # GET /beaters.json
  def index
    @beaters = Beater.all
  end

  # GET /beaters/1
  # GET /beaters/1.json
  def show
  end

  # GET /beaters/new
  def new
    @beater = Beater.new
  end

  # GET /beaters/1/edit
  def edit
  end

  # POST /beaters
  # POST /beaters.json
  def create
    @beater = Beater.new(beater_params)
    respond_to do |format|
      if @beater.save
        format.html { redirect_to @beater, notice: 'Beater was successfully created.' }
        format.json { render :show, status: :created, location: @beater }
      else
        format.html { render :new }
        format.json { render json: @beater.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /beaters/1
  # PATCH/PUT /beaters/1.json
  def update
    respond_to do |format|
      if @beater.update(beater_params)
        format.html { redirect_to @beater, notice: 'Beater was successfully updated.' }
        format.json { render :show, status: :ok, location: @beater }
      else
        format.html { render :edit }
        format.json { render json: @beater.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /beaters/1
  # DELETE /beaters/1.json
  def destroy
    @beater.destroy
    respond_to do |format|
      format.html { redirect_to beaters_url, notice: 'Beater was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_beater
      @beater = Beater.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def beater_params
      params.require(:beater).permit(:name, :provider, :url)
    end
end
