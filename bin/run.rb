#!/usr/bin/env ruby

require_relative '../config/environment.rb'
# require_relative './geocoder.rb'
require 'pry'
require 'pp'


# Greeting and identification
# ---------------------------------------------------------------------------------------
puts "Hello, I am your personal weather man!"

puts "What is your name?"
username = gets.strip
new_user = User.new(username)
puts ""
puts ""
puts "Nice to meet you, #{new_user.name}!"

# Main Menu
#---------------------------------------------------------------------------------------
input = nil
    while input != "4"
        puts ""
        puts "---------------------------------------------"
        puts "Please select from the following (enter 1-4):"
        puts "---------------------------------------------"
        puts "1. Search for a new location"
        puts "2. View saved locations"
        puts "3. Get Forecast"
        puts "4. Exit"
        input = gets.strip

        case input
        when "1"
            while answer == "n"
                puts "Please enter a location.  You can search by address, city, zip code, etc.:"
                loc = gets.strip
                geocoder = Geocoder.new
                attributes = geocoder.geocode(loc)
                pp attributes
                
                # new_loc.display_info
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
            # puts "Would you like to save #{name}? (y/n)"
            # answer = gets.strip
            # if (answer.downcase == "y") || (answer.downcase == "yes")
            #     new_user.add_location(new_loc)
            puts "#{name} has been added to your list of locations!"
                # main_menu
            # else
                # main_menu
            # end
        when "2"
            new_user.list_locations
            # main_menu
        when "3"

           

            new_user.list_locations
            puts "For which location? (Choose a saved location's number, or type \"n\" to enter a new location)"
            forecast_loc = new_user.locations[gets.strip.to_i - 1]
            forecaster = Forecast.new(forecast_loc)
            puts ""
            puts "----------------------------"
            puts "What kind of forecast? (1-4)"
            puts "----------------------------"
            puts "1. Today -- Summary"
            puts "2. Today -- Hourly"
            puts "3. 3-day"
            puts "4. 7-day"
            forecaster.get_forecast(gets.strip.to_s)
            # case gets.strip
            # when "1"
            #     forecaster.get_forecast("1")
            # when "2"

            # when "3"
            #     forecaster.get_forecast("3")
            # when "4"
                
            # when "5"

            # else

            # end
            # new_forecast = forecaster.get_forecast
            # binding.pry
            # new_forecast.display
        when "4"
            exit
        when "5"
            exit
        else
            # main_menu
        end
    end
# end