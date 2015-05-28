class ForecastsController < ApplicationController
	def index
		# binding.pry
		if (request.remote_ip) == "127.0.0.1"
			ip = ["96.224.241.215"].sample #"104.246.93.201", 
		else
			ip = request.remote_ip
		end
		@forecast = Forecast.new(ip).hash_weather
	end
end
