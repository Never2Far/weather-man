require 'httparty'
require 'pry'


class Location

@@all = []

attr_accessor :user_input, :name, :coordinates, :lat, :lng, :street, :city, :state, :zip, :county, :country, :neighborhood, :map_url



  def initialize(lat, lng, nickname = nil, *args)
    @coordinates
    @lat
    @lng
    @street
    @city
    @state
    @zip
    @county
    @country
    @user_input = user_input
    @name = nickname
    @map_url = map_url
    save
  end

  def save
    @@all << self
  end

  def self.all
    return @@all
  end

  # $base_url = "http://www.mapquestapi.com/geocoding/v1/address?key=jD1z4gMfiupsX29tyYAdeEs5jW4jB3Id&location="

  # def geocode(user_input)
  #   url = $base_url + user_input

  #   response = HTTParty.get(url)
  #   return response["results"][0]["locations"][0]["latLng"]
  # end

  def info
    info = {:user_input => @user_input,
            :name => @name,
            :coordinates => @coordinates,
            :lat => @lat,
            :lng => @lng,
            :street => @street,
            :city => @city,
            :state => @state,
            :zip => @zip,
            :county => @county
            }
      return info
  end



  def display_coordinates(coordinates_hash)
    lat = coordinates_hash["lat"]
    lng = coordinates_hash["lng"]

    puts "The coordinates of #{$user_input}:"
    puts " "
    puts "Latitude: #{lat.round(4)}"
    puts "Longitude: #{lng.round(4)}"
  end

end


# puts "Please enter a location:"
# $user_input = gets.strip



# raw_coordinates_hash = get_lat_long_hash($user_input)
# display_coordinates(raw_coordinates_hash)
# # puts response