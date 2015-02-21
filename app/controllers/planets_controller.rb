class PlanetsController < ApplicationController
  def index
  	#shows list of planets
  	#needs a view
    @planets = Planet.all
  end

  def show
    @planet = Planet.find(params[:id])
  end

  def new
    #shows the form
    #needs a view
    @planet = Planet.new
  end

  def create
  	#processes the form
    #get data from the form
    planet_params = params.require(:planet).permit(:name, :position, :orbital_speed, :mass, :volume)
    #give data to the model
    @planet = Planet.new(planet_params)
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
    @planet = Planet.find(params[:id])
  end

  def update
    planet_params = params.require(:planet).permit(:name, :position, :orbital_speed, :mass, :volume)
    @planet = Planet.find(params[:id])
    @planet.update(planet_params)
    redirect_to @planet
  end

  def destroy
    @planet  = Planet.find(params[:id])
    @planet.destroy
    redirect_to planets_path
  end

end