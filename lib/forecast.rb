require 'httparty'
require 'pry'
require 'open-uri'
require 'json'
require 'nokogiri'



 class Forecast

    

    attr_accessor :latLng, :request_url, :type, :grid_id, :grid_x, :grid_y
    attr_reader :location

    def initialize(location)
        @base_url = "https://api.weather.gov/"
        @grid_id
        @grid_x
        @grid_y
        lat = location.lat.round(4)
        lng = location.lng.round(4)
        get_grid(lat,lng)
        # @forecast_type = type
        # @latLng = Location.geocode(location_string)
        # @request_url = get_full_url
    end

    # def self.base_url
    #     return @base_url
    # end

    def get_grid(lat,lng)
        url = @base_url + "points/#{lat},#{lng}"
        # response = JSON.parse(open(url).read)
        response = request(url)
        @grid_id = response["properties"]["gridId"]
        @grid_x = response["properties"]["gridX"]
        @grid_y = response["properties"]["gridY"]
    end


    # def get_full_url
    #     lat = @latLng["lat"].round(4)
    #     lng = @latLng["lng"].round(4)
    #     ending = "#{lat.round(4)},#{lng.round(4)}"
    #     full_url = @base_url + ending
    #     return full_url
    # end

    def get_type
            puts ""
            puts "----------------------------"
            puts "What kind of forecast? (1-4)"
            puts "----------------------------"
            puts "1. Today -- Summary"
            puts "2. Today -- Hourly"
            puts "3. 3-day"
            puts "4. 7-day"
            return gets.strip.to_s
    end

    def get_forecast(type = "1")
        forecast_url = @base_url + "gridpoints/#{@grid_id}/#{grid_x},#{grid_y}/forecast"
        response = request(forecast_url)
        # binding.pry
        case type
        when "1" #current/now/today, summary
            periods = response["properties"]["periods"]
            puts "#{periods[0]["name"]}: #{periods[0]["detailedForecast"]}" 
            puts ""
            puts "#{periods[1]["name"]}: #{periods[1]["detailedForecast"]}" 
        when "2" #today, hourly
        
        when "3" #next 3 days
            periods = response["properties"]["periods"]

            # today = response["properties"]["periods"][0]
            # tonight = response["properties"]["periods"][1]
            # day_1 = response["properties"]["periods"][2]
            # night_1 = response["properties"]["periods"][3]
            # day_2 = response["properties"]["periods"][4]
            # night_2 = response["properties"]["periods"][5]
            # day_3 = response["properties"]["periods"][6]
            # night_3 = response["properties"]["periods"][7]
            puts "#{periods[0]["name"]}: #{periods[0]["detailedForecast"]}"
            puts "" 
            puts "#{periods[1]["name"]}: #{periods[1]["detailedForecast"]}" 
            puts ""
            puts "#{periods[2]["name"]}: #{periods[2]["detailedForecast"]}" 
            puts ""
            puts "#{periods[3]["name"]}: #{periods[3]["detailedForecast"]}" 
            puts ""
            puts "#{periods[4]["name"]}: #{periods[4]["detailedForecast"]}" 
            puts ""
            puts "#{periods[5]["name"]}: #{periods[5]["detailedForecast"]}"
            puts ""
            puts "#{periods[6]["name"]}: #{periods[6]["detailedForecast"]}" 
            puts ""
            puts "#{periods[7]["name"]}: #{periods[7]["detailedForecast"]}"
            puts ""
            puts ""
            puts "" 
        when "4" #next 7 days
        else
            
        end
        # return new_forecast
     # case type
        # when "current"
        #     request(@full_url)
        #     forecast = response["properties"]["forecast"]
        # when 
        # # else            
        # end  if   
    end

    # $base_url = "https://api.weather.gov/points/"

    # def get_by_coordinates(coordinates_hash)
    #     lat = coordinates_hash["lat"].round(4)
    #     lng = coordinates_hash["lng"].round(4)
    #     ending = "#{lat.round(4)},#{lng.round(4)}"
    #     full_url = @base_url + ending
    #     response = request(full_url)
    #     forecast_url = response["properties"]["forecast"]
    #     forecast = request(forecast_url)
    #     binding.pry
    #     display_response(response)
    # end
    def display()


    end



    def request(url)
        return JSON.parse(open(url).read)
    end

    # def display_response(response)
    #     puts response
    #     binding.pry
    # end

end



# coordinates = {"lat"=>38.67515, "lng"=>-90.375989}
# Forecast.newget_by_coordinates(coordinates)

# https://api.weather.gov/points/{latitude},{longitude}