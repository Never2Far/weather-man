require 'httparty'
require 'pry'
require 'open-uri'
require 'json'
require 'nokogiri'



 def Forecast

    @@base_url = "https://api.weather.gov/points/"

    attr_accessor :latLng, :request_url

    def initialize(location_string)
        @latLng = Location.geocode(location_string)
        @request_url = get_full_url
    end

    def self.base_url
        return @@base_url
    end

    def get_full_url
        lat = @latLng["lat"].round(4)
        lng = @latLng["lng"].round(4)
        ending = "#{lat.round(4)},#{lng.round(4)}"
        full_url = @@base_url + ending
        return full_url
    end

    def get_forecast(type = "current")
        response = request(@full_url)
        # case type
        # when "current"
        #     request(@full_url)
        #     forecast = response["properties"]["forecast"]
        # when 
            
        # # else
            
        # end

    end

    # $base_url = "https://api.weather.gov/points/"

    def get_by_coordinates(coordinates_hash)
        lat = coordinates_hash["lat"].round(4)
        lng = coordinates_hash["lng"].round(4)
        ending = "#{lat.round(4)},#{lng.round(4)}"
        full_url = $base_url + ending
        response = request(full_url)
        forecast_url = response["properties"]["forecast"]
        forecast = request(forecast_url)
        binding.pry
        display_response(response)
    end



    def request(url)
        return JSON.parse(open(url).read)
    end

    def display_response(response)
        puts response
        binding.pry
    end

end

# coordinates = {"lat"=>38.67515, "lng"=>-90.375989}
# Forecast.newget_by_coordinates(coordinates)

# https://api.weather.gov/points/{latitude},{longitude}