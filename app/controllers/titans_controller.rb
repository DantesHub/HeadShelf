class TitansController < ApplicationController
  before_action :set_titan, only: [:show, :edit, :update, :destroy]
  layout "titan"

  # GET /titans
  # GET /titans.json
  def index
    @titans = Titan.all 
  end

  # GET /titans/1
  # GET /titans/1.json
  def show
  end

  # GET /titans/new
  def new
    @titan = Titan.new
  end

  # GET /titans/1/edit
  def edit
  end

  # POST /titans
  # POST /titans.json
  def create
    @titan = Titan.new(titan_params)

    respond_to do |format|
      if @titan.save
        format.html { redirect_to @titan, notice: 'Titan was successfully created.' }
        format.json { render :show, status: :created, location: @titan }
      else
        format.html { render :new }
        format.json { render json: @titan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /titans/1
  # PATCH/PUT /titans/1.json
  def update
    respond_to do |format|
      if @titan.update(titan_params)
        format.html { redirect_to @titan, notice: 'Titan was successfully updated.' }
        format.json { render :show, status: :ok, location: @titan }
      else
        format.html { render :edit }
        format.json { render json: @titan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /titans/1
  # DELETE /titans/1.json
  def destroy
    @titan.destroy
    respond_to do |format|
      format.html { redirect_to titans_url, notice: 'Titan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_titan
      @titan = Titan.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def titan_params
      params.require(:titan).permit(:name, :body, :thumb_image, :main_image)
    end
end
