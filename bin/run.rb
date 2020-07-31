#!/usr/bin/env ruby

require_relative '../config/environment.rb'
# require_relative './geocoder.rb'
require 'pry'


# geocoder = Geocoder.new
# attributes = geocoder.geocode("1016 Laval Dr.")
# name = "Home"
# home = Location.new(name, attributes)
# binding.pry

new_user = User.intro

# module Interface

    # def intro
    #     puts "What is your name?"
    #     username = gets.strip
    #     user = User.new(username)
    #     puts ""
    #     puts ""
    #     puts "Welcome, #{username}!"
    # end
input = nil
    while input != "4"
        puts "Please select from the following (enter 1-4):"
        puts "--------------------------------------------"
        puts "1. Add new location"
        puts "2. View saved locations"
        puts "3. Get Forecast"
        puts "4. Exit"
        input = gets.strip

        case input
        when "1"
            puts "Enter a name for this location (ex. Home, Work, etc.):"
            name = gets.strip
            puts "Where is #{name}?"
            loc = gets.strip
            geocoder = Geocoder.new
            attributes = geocoder.geocode(loc)
            new_loc = Location.new(name, attributes)
            new_loc.display_info
            puts ""
            puts "Would you like to save #{name}? (y/n)"
            answer = gets.strip
            if (answer.downcase == "y") || (answer.downcase == "yes")
                new_user.add_location(new_loc)
                puts "#{name} has been added to your list of locations!"
                # main_menu
            else
                # main_menu
            end
        when "2"
            new_user.list_locations
            # main_menu
        when "4"
            exit
        else
            # main_menu
        end
    end
# end