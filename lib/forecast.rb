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
    end


    def get_grid(lat,lng)
        url = @base_url + "points/#{lat},#{lng}"
        response = request(url)
        @grid_id = response["properties"]["gridId"]
        @grid_x = response["properties"]["gridX"]
        @grid_y = response["properties"]["gridY"]
    end

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
        if type == "2"
            forecast_url = @base_url + "gridpoints/#{@grid_id}/#{grid_x},#{grid_y}/forecast/hourly"
        else
            forecast_url = @base_url + "gridpoints/#{@grid_id}/#{grid_x},#{grid_y}/forecast"
        end
        response = request(forecast_url)
        pp response
        periods = response["properties"]["periods"]
        case type
            when "1" #today, summary
            
                puts "#{periods[0]["name"]}: #{periods[0]["detailedForecast"]}" 
                puts ""
                puts "#{periods[1]["name"]}: #{periods[1]["detailedForecast"]}" 
            when "2" #today, hourly
                24.times { |i|
                    time = periods[i]["startTime"][11,5]
                    puts "#{time}: #{periods[i]["temperature"]}°#{periods[i]["temperatureUnit"]}, #{periods[i]["shortForecast"]}"
                }
            when "3" #next 3 days
                8.times { |i|
                    puts "#{periods[i]["name"]}: #{periods[i]["detailedForecast"]}"
                    puts ""
                }
            when "4" #next 7 days
                14.times { |i|
                    puts "#{periods[i]["name"]}: #{periods[i]["detailedForecast"]}"
                    puts ""
                }
        else
        end
    end

    def request(url)
        return JSON.parse(open(url).read)
    end

end