class PlanetsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
  	#shows list of planets
  	#needs a view
    #cancan does this for us@planets = Planet.all
  end

  def show
   #cancan does this for us @planet = Planet.find(params[:id])
  end

  def new
    #shows the form
    #needs a view
   #cancan does this for us @planet = Planet.new
  end

  def create
  	#processes the form
    #give data to the model
    #cancan does this for us@planet = Planet.new(planet_params)
    @planet.user = current_user
    #save the model
    if @planet.save
      #redirect to show or index
      redirect_to @planet
    else
      render :new
    end
  end

  

  def edit
  	#shows the form with data about planet prepopulated
  	#needs a view
    #cancan does this for us @planet = Planet.find(params[:id])
  end

  def update
    #cancan does this for us @planet = Planet.find(params[:id])
    @planet.update(planet_params)
    redirect_to @planet
  end

  def destroy
    #cancan does this for us@planet  = Planet.find(params[:id])
    @planet.destroy
    redirect_to planets_path
  end

end

private

def planet_params
  planet_params = params.require(:planet).permit(:name, :position, :orbital_speed, :mass, :volume)
end