class MoonsController < ApplicationController
  before_action :authenticate_user!
  
  def index
  	#shows list of planets
  	#needs a view
    @moons = Moon.all
  end

  def show
    @moon = Moon.find(params[:id])
  end

  def new
    #shows the form
    #needs a view
    @moon = Moon.new
  end

  def create
  	#processes the form
    #get data from the form
    moon_params = params.require(:moon).permit(:name, :position, :orbital_speed, :mass, :volume)
    #give data to the model
    @moon = Moon.new(planet_params)
    #save the model
    if @moon.save
      #redirect to show or index
      redirect_to @moon
    else
      render :new
    end
  end

  

  def edit
  	#shows the form with data about moon prepopulated
  	#needs a view
    @moon = Moon.find(params[:id])
  end

  def update
    planet_params = params.require(:moon).permit(:name, :position, :orbital_speed, :mass, :volume)
    @moon = moon.find(params[:id])
    @moon.update(planet_params)
    redirect_to @moon
  end

  def destroy
    @moon  = moon.find(params[:id])
    @moon.destroy
    redirect_to planets_path
  end


end
