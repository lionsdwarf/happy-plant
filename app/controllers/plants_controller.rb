class PlantsController < ApplicationController

  before_action :authenticate

  def index
    render json: Plant.all
  end

  def show
    @plant = Plant.find(params[:id])
  
    respond_to do |format|
      format.html {}
      format.json { render json: @plant }
    end
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.user_id = current_user.id
    @plant.last_notified = DateTime.now.to_i.to_s
    @plant.save

    respond_to do |format|
      format.html { redirect_to plant_path(@plant.id) } 
      format.json { render json: @plant }
    end
  end

  def edit
    @plant = Plant.find(params[:id])
  end

  def update
    @plant = Plant.find(params[:id])
    @plant.update(plant_params)

    respond_to do |format|
      format.html { redirect_to plant_path(@plant.id) }
      format.json { render json: @plant }
    end
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy

    respond_to do |format|
      format.html { redirect_to user_path(current_user) }
      format.json { render json: @plant }
    end
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :plant_type, :stamina, :photo_url, :user_id, :last_notified)
  end

end