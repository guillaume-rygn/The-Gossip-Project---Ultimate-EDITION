class CitiesController < ApplicationController

  def show
    @id = params[:id]
    @city = City.find(params[:id])
    @gossip = Gossip.all
  end

end