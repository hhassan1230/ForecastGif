class ForecastsController < ApplicationController
	def index
	end


	def get_weather
		if params["latitude"]
			@forecast = Forecast.new(nil, {"latitude"=> params["latitude"].to_f, "longitude" => params["longitude"].to_f}).hash_weather
			render 'geoindex'
		else
			if (request.remote_ip) == "127.0.0.1"
				ip = ["104.246.93.201"].sample #"104.246.93.201", "96.224.241.215"
			else
				ip = request.remote_ip
			end
			@forecast = Forecast.new(ip).hash_weather
			render 'geoindex'
		end
	end
end
