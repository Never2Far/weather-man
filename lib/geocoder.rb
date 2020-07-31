#Given a location string, (address, zipcode, city, latitude/logitude etc.) queries the Mapquest API and returns a hash 
#containing "normalized" location info.

require 'httparty'
require 'pry'
require 'open-uri'
require 'json'
require 'pp'


class Geocoder

    attr_accessor :input, :output
    attr_reader :base_url
    

    def initialize
        @base_url = "http://www.mapquestapi.com/geocoding/v1/address?key=jD1z4gMfiupsX29tyYAdeEs5jW4jB3Id&location="
    end


    def geocode(search_string)
        input = search_string
        url = @base_url + input
        response = HTTParty.get(url)
        location_hash = response["results"][0]["locations"][0]
        output = {
                    :street => location_hash["street"],
                    :neighborhood => location_hash["adminArea6"],
                    :city => location_hash["adminArea5"],
                    :county => location_hash["adminArea4"],
                    :state => location_hash["adminArea3"],
                    :zip => location_hash["postalCode"],
                    :country => location_hash["adminArea1"],
                    :lat => location_hash["latLng"]["lat"],
                    :lng => location_hash["latLng"]["lng"],
                    :mapUrl => location_hash["mapUrl"]
                 }
        output.each {|key, value| value == "" ? output[key] = nil : false}
        return output
    end
end