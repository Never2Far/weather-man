#Given a location string (address, zipcode, city, etc.) returns a hash 
#containing the latitude and longitude rounded to given 
# number of decimals (default = 4) (using MapQuest API)
# Ex.  {"lat"=>35.6543, "lng"=>-98.5432}


require 'httparty'
require 'pry'
require 'open-uri'
require 'json'
# require 'nokogiri'

class Geocoder

    # $base_url = "http://www.mapquestapi.com/geocoding/v1/address?key=jD1z4gMfiupsX29tyYAdeEs5jW4jB3Id&location="

    attr_accessor :input, :output
    attr_reader :base_url


    def initialize
        @base_url = "http://www.mapquestapi.com/geocoding/v1/address?key=jD1z4gMfiupsX29tyYAdeEs5jW4jB3Id&location="
        @input
        @output
        # unless input_string == nil
        #     @output = geocode(input_string)
        # end
    end


    def geocode(search_string, decimals = 4)
        @input = search_string
        url = @base_url + @input
        response = HTTParty.get(url)
        binding.pry
        location_hash = response["results"][0]["locations"][0]
        @output = {
                    :street => [location_hash]["street"],
                    :neighborhood => [location_hash]["adminArea6"],
                    :city => [location_hash]["adminArea5"],
                    :county => [location_hash]["adminArea4"],
                    :state => [location_hash]["adminArea3"],
                    :zip => [location_hash]["postalCode"],
                    :country => [location_hash]["adminArea1"],
                    :lat => [location_hash]["latLng"]["lat"].round(4),
                    :lng => [location_hash]["latLng"]["lng"].round(4),
                    :coordinates => [location_hash]["lng"],
                    :unknownInput => [location_hash]["unknownInput"],
                    :mapUrl => [location_hash]["mapUrl"]
                 }
        # response["results"][0]["locations"][0]["latLng"]
        lat = @output["lat"].round(4)
        lng = @output["lng"].round(4)
        return [lat, lng]
    end

    def reverse(lat, lng)
        
    end

    def location_info

    end





end



geocoder = Geocoder.new

puts "Please enter a location:"
input = gets.strip

output = geocoder.geocode(input)
puts output