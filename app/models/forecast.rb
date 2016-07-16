require 'geocoder'
require 'open-uri'
class Forecast < ActiveRecord::Base
	attr_reader :the_call, :ip_address, :lat, :long, :hash_weather, :time
		geocoded_by :ip_address,
	  	:latitude => :lat, :longitude => :long
		# after_validation :geocode
	def initialize(ip=nil, location={}, time=nil)
		@ip_address = ip
		geo_stats = {}
		if time
			@time = time
		end
		if location["latitude"] && location["longitude"]
			@latitude = location["latitude"].round(2)
			@longitude = location["longitude"].round(2)
			geo_stats = {"longitude" => @longitude, "latitude" => @latitude}
		else
			geo_array = Geocoder.search(ip)
			geo_array.each do |char|
				geo_stats = char.data
			end	
		end
		@the_call = "https://api.forecast.io/forecast/#{ENV["APIKEY"]}/#{geo_stats["latitude"]},#{geo_stats["longitude"]}"
		file = open(@the_call)
		read = File.read(file)
		@hash_weather = JSON.parse(read)
		if @time
			d = DateTime.parse(@time)
			final_date = ((Time.at(d).to_time)).strftime "%l:%M %P"
			@hash_weather["currently"]["time"] = final_date
		else
			if ((Time.at(@hash_weather["currently"]["time"]).to_time)).month == (2...11)
				@hash_weather["currently"]["time"] = ((Time.at(@hash_weather["currently"]["time"]).to_time) - 4.hours).strftime "%l:%M %P"
			else
				@hash_weather["currently"]["time"] = ((Time.at(@hash_weather["currently"]["time"]).to_time) - 5.hours).strftime "%l:%M %P"
			end 
		end
		@hash_weather
	end



end
