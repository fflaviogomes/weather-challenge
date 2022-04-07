class FavoriteCitiesController < ApplicationController
  def index
    @cidades = FavoriteCity.all
  end

  def create
    @cidade = FavoriteCity.new(city:params[:city])

    if @cidade.save

      @cidades = FavoriteCity.all

      render partial: 'favorite_cities/form'

    else      
      head :unprocessable_entity

    end    
  end

  def destroy
    @cidade = FavoriteCity.find(params[:id])
    @cidade.destroy

    #redirect_to root_path, status: :see_other
  end

  private
    def favorite_city_params
      params.require(:favorite_city).permit(:city)
    end

end