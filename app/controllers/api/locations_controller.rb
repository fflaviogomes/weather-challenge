module API
  class LocationsController < APIController
    def show
      render json: Openweather2.get_weather(city: "#{params[:id].gsub('-', ' ')},BR", units: params[:units] ? params[:units] : 'imperial')
      rescue
        render json: { error: "Not found"}, status: 404
    end
  end

end