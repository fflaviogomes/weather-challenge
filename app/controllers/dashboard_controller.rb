#require 'net/http'
#require 'net/https'

class DashboardController < ApplicationController

  def index

    @weather = get_weather2(city: get_cidade(), units: 'imperial')

  end

  #def json; Openweather2.get_weather(lat: 35, lon: 139, units: 'imperial'); end

end

#Acredito que essas funções deveriam estar em models. Não soube localizar exatamente onde colocá-la no Rails.

def get_weather2 (options={})

  #Chamada da função original 
  #todo: rescue? UnknownResponse, UnprocessableError
  begin
    @weather = Openweather2.get_weather(options);  
  rescue Openweather2::UnknownResponse
    #@weather = Openweather2.Weather.new();
    
  end
  

  #Conversão de F/K para C e vice-versa
  case options[:units]
  when 'imperial'
    def @weather.temperatureC;     TempConv.f_to_c(self.temperature)     end
    def @weather.min_temperatureC; TempConv.f_to_c(self.min_temperature) end
    def @weather.max_temperatureC; TempConv.f_to_c(self.max_temperature) end

  when 'metric'
    def @weather.temperatureC;     self.temperature     end
    def @weather.min_temperatureC; self.min_temperature end
    def @weather.max_temperatureC; self.max_temperature end

  else
    def @weather.temperatureC;     TempConv.k_to_c(self.temperature)     end
    def @weather.min_temperatureC; TempConv.k_to_c(self.min_temperature) end
    def @weather.max_temperatureC; TempConv.k_to_c(self.max_temperature) end

  end

  return @weather

end


class TempConv

  def self.f_to_c(temperatureF, decimals = 2)

    temperatureC = (temperatureF - 32) / 1.8;

    return temperatureC.round(decimals)

  end

  def self.k_to_c(temperatureK, decimals = 2)

    temperatureC = (temperatureK - 273.15);

    return temperatureC.round(decimals)

  end

end

def get_cidade (cidade_default = "Sao Paulo, BR")

  #Busca cidade por GET
  return_cidade = params[:f_cidade];

  #Se não encontrar GET tenta GeoLocation API
  if (return_cidade.blank?)
    loc = ipgeolocation_get()

    return_cidade = loc["city"];

    #Se não encontrar GeoLocation usa default
    if (return_cidade.blank?)
      #Default: Sao Paulo, BR

      return_cidade = cidade_default;

    end
  end

  return return_cidade;

end

#require 'net/http'
#require 'net/https'

def ipgeolocation_get

  # Não funciona em ambiente de desenvolvimento ou rede local/intranet
  # Alternativa: Javascript -> https://developer.mozilla.org/en-US/docs/Web/API/Geolocation/getCurrentPosition

  # reference: https://www.abstractapi.com/guides/how-to-do-ip-geolocation-in-ruby-on-rails

  config_geolocation_api_key  = "a96a661a961e42ccaf2e798f17879d7f";
  user_ip = request.remote_ip;

  uri = URI("https://ipgeolocation.abstractapi.com/v1/?api_key=#{config_geolocation_api_key}&ip_address=#{user_ip}&fields=city,country_code")

  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER

  request = Net::HTTP::Get.new(uri)

  response = http.request(request)

  return JSON.parse(response.body)

rescue StandardError => error
  puts "Error (#{ error.message })"
end