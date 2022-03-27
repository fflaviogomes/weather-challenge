class DashboardController < ApplicationController
  def index
    @weather = get_weather2(city: 'Sao Paulo,BR', units: 'imperial')
    #@weather = Openweather2.get_weather(city: 'Belo Horizonte, BR', units: 'metric')

  end
end

#Acredito que essas funções deveriam estar em models. Não soube localizar exatamente onde colocá-la no Rails.

def get_weather2 (options={})

  #Chamada da função original 
  @weather = Openweather2.get_weather(options);

  #Conversão de F/K para C e vice-versa
  case options[:units]
  when 'imperial'
    def @weather.temperatureC;     temp_f_to_c(self.temperature)     end
    def @weather.min_temperatureC; temp_f_to_c(self.min_temperature) end
    def @weather.max_temperatureC; temp_f_to_c(self.max_temperature) end

  when 'metric'
    def @weather.temperatureC;     self.temperature     end
    def @weather.min_temperatureC; self.min_temperature end
    def @weather.max_temperatureC; self.max_temperature end

  else
    def @weather.temperatureC;     temp_k_to_c(self.temperature)     end
    def @weather.min_temperatureC; temp_k_to_c(self.min_temperature) end
    def @weather.max_temperatureC; temp_k_to_c(self.max_temperature) end

  end

  return @weather

end

def temp_f_to_c(temperatureF, decimals = 2)

  temperatureC = (temperatureF - 32) / 1.8;

  return temperatureC.round(decimals)

end

def temp_k_to_c(temperatureK, decimals = 2)

  temperatureC = (temperatureK - 273);

  return temperatureC.round(decimals)

end