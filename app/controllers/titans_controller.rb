class TitansController < ApplicationController
  def index
    @titans = Titan.all
  end

  def show
    @titan = Titan.find(params[:id])
  end

  def new
    @titan = Titan.new
  end

  def create
    @titan = Titan.new(params.require(:titan).permit(:name, :body))
    respond_to do |format|
      if @titan.save
        format.html { redirect_to titans_path, notice: 'Titan was successfully created.' }
      else
        format.html { render :new }
      end
    end
 end

  def edit
    @titan = Titan.find(params[:id])
  end

  def update
    @titan = Titan.find(params[:id])
    respond_to do |format|
      if @titan.update(params.require(:titan).permit(:name, :body))
        format.html { redirect_to titans_path, notice: 'Titan was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    # perform the look  up
    @titan = Titan.find(params[:id])
    # delete
    @titan.destroy
    # redirect
    respond_to do |format|
      format.html { redirect_to titans_url, notice: 'Titan was successfully removed.' }
    end
  end
end
