#!/usr/bin/env ruby

require_relative '../config/environment.rb'
require 'pry'
require 'pp'


# Greeting and identification
# ---------------------------------------------------------------------------------------
puts "Hello, I am your personal weather man!"

puts "What is your name?"
username = gets.strip
new_user = User.new(username)
# user_locations = File.open("user_credentials.txt", 'w')
puts ""
puts ""
puts "Nice to meet you, #{new_user.name}!"

# Main Menu
#---------------------------------------------------------------------------------------
input = nil
skip_to = nil
    while input != "4"
        unless skip_to
            puts ""
            puts "---------------------------------------------"
            puts "Please select from the following (enter 1-4):"
            puts "---------------------------------------------"
            puts "1. Search for a new location"
            puts "2. View saved locations"
            puts "3. Get Forecast"
            puts "4. Exit"
            input = gets.strip
        else 
            input = skip_to
        end

        case input
        when "1"
            answer = "n"
            while answer == "n"
                puts "Please enter a location.  You can search by address, city, zip code, etc.:"
                loc = gets.strip
                geocoder = Geocoder.new
                attributes = geocoder.geocode(loc)
                pp attributes
                puts ""
                puts "Is that the correct location? (y/n)"
                answer = gets.strip
                if (answer.downcase == "n") || (answer.downcase == "no")
                    answer = "n"
                else
                    answer = "y"
                end
            end
            puts "Enter a name for this location (ex. Home, Work, etc.):"
            name = gets.strip
            new_loc = Location.new(name, attributes)
            new_user.add_location(new_loc)
            puts "#{name} has been added to your list of locations!"
            puts "Would you like to get the forecast for #{name} (y/n)?"
            if gets.strip.downcase == "y"
                forecaster = Forecast.new(new_user.locations.last)
                type = forecaster.get_type
                forecaster.get_forecast(type)
            end
            skip_to = nil
        when "2"
            new_user.list_locations
        when "3"
            new_user.list_locations
            puts "For which location? (Choose a saved location's number, or type \"n\" to enter a new location)"
            answer = gets.strip.downcase
            unless answer == "n"
                forecast_loc = new_user.locations[answer.to_i - 1]
                forecaster = Forecast.new(forecast_loc)
                type = forecaster.get_type
                forecaster.get_forecast(type)
            else
                skip_to = "1"
            end
        when "4"
            puts ""
            puts "Goodbye!"
            puts ""
            exit
        else
            skip_to = nil
        end
    end