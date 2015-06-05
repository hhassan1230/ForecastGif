require 'geocoder'
require 'open-uri'
class Forecast < ActiveRecord::Base
	attr_reader :the_call, :ip_address, :lat, :long, :hash_weather
		geocoded_by :ip_address,
	  	:latitude => :lat, :longitude => :long
		# after_validation :geocode
	def initialize(ip=nil, location={})
		@ip_address = ip
		geo_stats = {}
			# binding.pry
		if location["latitude"] && location["longitude"]
			# binding.pry
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
		@hash_weather
	end



end
