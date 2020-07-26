require 'httparty'
require 'pry'


def Location

@@all = []

attr_accessor :location_string, :name



  def initialize(location_string, name = nil)
    @location_string = location string
    @name = name
  save

  end

  def save
    @@all << self
  end

  def self.all
    return @@all
  end


  $base_url = "http://www.mapquestapi.com/geocoding/v1/address?key=jD1z4gMfiupsX29tyYAdeEs5jW4jB3Id&location="

  def geocode(location_string)
    url = $base_url + location_string

    response = HTTParty.get(url)
    return response["results"][0]["locations"][0]["latLng"]
  end





  def display_coordinates(coordinates_hash)
    lat = coordinates_hash["lat"]
    lng = coordinates_hash["lng"]

    puts "The coordinates of #{$location_string}:"
    puts " "
    puts "Latitude: #{lat.round(4)}"
    puts "Longitude: #{lng.round(4)}"
  end

end


# puts "Please enter a location:"
# $location_string = gets.strip



# raw_coordinates_hash = get_lat_long_hash($location_string)
# display_coordinates(raw_coordinates_hash)
# # puts response