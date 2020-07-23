require 'httparty'
require 'pry'





$base_url = "http://www.mapquestapi.com/geocoding/v1/address?key=jD1z4gMfiupsX29tyYAdeEs5jW4jB3Id&location="

def get_lat_long_hash(location_string)
  url = $base_url + location_string

  response = HTTParty.get(url)
  return response["results"][0]["locations"][0]["latLng"]
end

def display_coordinates(coordinates_hash)
  lat = coordinates_hash["lat"]
  lng = coordinates_hash["lng"]

  puts "The coordinates of #{$location_string}:"
  puts " "
  puts "Latitude: #{lat}"
  puts "Longitude: #{lng}"
end


puts "Please enter a location:"
$location_string = gets.strip



raw_coordinates_hash = get_lat_long_hash($location_string)
display_coordinates(raw_coordinates_hash)
# puts response