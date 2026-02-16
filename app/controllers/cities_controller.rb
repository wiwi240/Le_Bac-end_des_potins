class CitiesController < ApplicationController
  def show
    # Recherche de la ville par l'ID passé en paramètre
    @city = City.find(params[:id])
    # Récupération de tous les potins liés aux utilisateurs de cette ville
    @gossips = @city.gossips
  end
end