class TitansController < ApplicationController
  before_action :set_titan, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token
  access all: %i[show index], user: { except: %i[destroy new update edit sort] }, site_admin: :all
  layout 'titan'

  # GET /titans
  # GET /titans.json
  def index
    @titans = Titan.by_position
  end

  def sort
    params[:order].each do |_key, value|
      Titan.find(value[:id]).update(position: value[:position])
    end

    render nothing: true
  end

  # GET /titans/1
  # GET /titans/1.json
  def show; end

  # GET /titans/new
  def new
    @titan = Titan.new
  end

  # GET /titans/1/edit
  def edit; end

  # POST /titans
  def create
    # puts 'fasdfasdfasdfsfsafsdafasdfasdffsfoasufhuisdbgfisdbfiusdb'
    @titan = Titan.new(titan_params)
    respond_to do |format|
      if @titan.save
        format.html { redirect_to @titan, notice: 'Titan was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /titans/1
  # PATCH/PUT /titans/1.json
  def update
    respond_to do |format|
      if @titan.update(titan_params)
        format.html { redirect_to @titan, notice: 'Titan was successfully updated.' }
      else
        format.html { render :edit }
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
