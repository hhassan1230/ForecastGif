require 'geocoder'
require 'open-uri'
class Forecast < ActiveRecord::Base
	attr_reader :the_call, :ip_address, :lat, :long, :hash_weather
		geocoded_by :ip_address,
	  	:latitude => :lat, :longitude => :long
		after_validation :geocode
	def initialize(ip)
		@ip_address = ip
		geo_array = Geocoder.search(ip)
		geo_stats = {}
		geo_array.each do |char|
			geo_stats = char.data
		end
		@the_call = "https://api.forecast.io/forecast/#{ENV["APIKEY"]}/#{geo_stats["latitude"]},#{geo_stats["longitude"]}"
		file = open(@the_call)
		read = File.read(file)
		@hash_weather = JSON.parse(read)
		# binding.pry
		# return hash_weather
	end



end
