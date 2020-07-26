#Given a location string (address, zipcode, city, etc.) returns a hash 
#containing the latitude and longitude rounded to given 
# number of decimals (default = 4) (using MapQuest API)
# Ex.  {"lat"=>35.6543, "lng"=>-98.5432}


require 'httparty'
# require 'pry'
require 'open-uri'
require 'json'
require 'nokogiri'

def Geocoder

    $base_url = "http://www.mapquestapi.com/geocoding/v1/address?key=jD1z4gMfiupsX29tyYAdeEs5jW4jB3Id&location="

    attr_accessor :input, :output


    def initialize
        @input = nil
        @output = nil
        # unless input_string == nil
        #     @output = geocode(input_string)
        # end
    end


    def geocode(input_string, decimals = 4)
        url = $base_url + input_string
        response = HTTParty.get(url)
        @output = response["results"][0]["locations"][0]["latLng"]
        @output["lat"] = @output["lat"].round(4)
        @output["lng"] = @output["lng"].round(4)
        return @output
    end




end

geocoder = Geocoder.new

puts "Please enter a location:"
input = gets.strip

output = geocoder.geocode(input)
puts output