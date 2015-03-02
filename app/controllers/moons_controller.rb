class MoonsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
  	#shows list of planets
  	#needs a view
    #cancan does this for us @moons = Moon.all
  end

  def show
    #cancan does this for us @moon = Moon.find(params[:id])
  end

  def new
    #shows the form
    #needs a view
    #cancan does this for us @moon = Moon.new
  end

  def create
  	#processes the form
    #get data from the form
    
    #give data to the model
    #cancan does this for us@moon = Moon.new(moon_params)
    @moon.user = current_user 
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
    #cancan does this for us @moon = Moon.find(params[:id])
  end

  def update
    #cancan does this for us @moon = moon.find(params[:id])
    @moon.update(planet_params)
    redirect_to @moon
  end

  def destroy
    #cancan does this for us @moon  = moon.find(params[:id])
    @moon.destroy
    redirect_to planets_path
  end

  def moon_params
    moon_params = params.require(:moon).permit(:name, :position, :orbital_speed, :mass, :volume)
  end


end
